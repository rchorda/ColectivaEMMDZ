#!/usr/bin/env python3
"""Genera una inclusión LilyPond con el esquema del pasaje."""
import argparse
from dataclasses import dataclass
import json
from pathlib import Path
import re

NAMES = ("Do", "Re", "Mi", "Fa", "Sol", "La", "Si")
NATURAL = dict(zip(NAMES, (0, 2, 4, 5, 7, 9, 11)))
STRINGS = {"Sol": (55, 4), "Re": (62, 8), "La": (69, 12), "Mi": (76, 16)}
SHARPS = ("Fa", "Do", "Sol", "Re", "La", "Mi", "Si")
FLATS = SHARPS[::-1]
FALLBACK = ("Do", "Do♯", "Re", "Mi♭", "Mi", "Fa", "Fa♯", "Sol", "Sol♯", "La", "Si♭", "Si")
COLORS = {
    "negro": (0.07, 0.07, 0.07),
    "tenue": (0.79, 0.80, 0.82),
    "gris": (0.48, 0.50, 0.53),
    "linea": (0.33, 0.35, 0.38),
    "verde": (0.14, 0.40, 0.25),
    "rojo": (0.70, 0.13, 0.17),
    "azul": (0.08, 0.33, 0.64),
}
PRIORITY = {color: index for index, color in enumerate(("negro", "verde", "rojo", "azul"))}
FLAGS = {"cruce", "escala", "cifra-original", "alternativa"}


@dataclass(frozen=True)
class Finger:
    number: int
    alternative: bool
    color: str


@dataclass
class Cell:
    name: str
    delta: int
    fingers: dict[tuple[int, bool], Finger]


def roman(position):
    tens, units = divmod(position, 10)
    return "X" * tens + ("", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")[units]


def note_name(name, alteration):
    sign = "♯" if alteration > 0 else "♭"
    return name + sign * abs(alteration)


def key_signature(count):
    if type(count) is not int or not -7 <= count <= 7:
        raise ValueError("armadura debe ser un entero entre -7 (bemoles) y 7 (sostenidos)")
    order = SHARPS if count > 0 else FLATS
    return {name: (1 if count > 0 else -1) if name in order[:abs(count)] else 0
            for name in NAMES}


def pitch_at_degree(degree, signature):
    octave, index = divmod(degree, 7)
    name = NAMES[index]
    return 48 + 12 * octave + NATURAL[name] + signature[name]


def read_cells(entries, signature):
    cells = {}
    for position, string, pitch, finger, *flags in entries:
        if type(position) is not int or position < 1 or string not in STRINGS:
            raise ValueError(f"Posición o cuerda inválida: {position}, {string}")
        if type(finger) is not int or not 0 <= finger <= 4 or not set(flags) <= FLAGS:
            raise ValueError(f"Dedo o marca inválidos: {finger}, {flags}")
        match = re.fullmatch(r"(Do|Re|Mi|Fa|Sol|La|Si)(#{1,2}|b{1,2})?([0-9])", pitch)
        if not match:
            raise ValueError(f"Usa la grafía Do5, Sol#5 o Mib5 para indicar nota y octava: {pitch}")
        name, sign, octave = match.groups()
        alteration = (sign or "").count("#") - (sign or "").count("b")
        midi = 12 * (int(octave) + 1) + NATURAL[name] + alteration
        offset = midi - STRINGS[string][0]
        if offset < 0 or (offset == 0) != (finger == 0):
            raise ValueError(f"{pitch} no es compatible con cuerda {string} y dedo {finger}")

        delta = alteration - signature[name]
        color = "negro"
        if "cruce" in flags:
            color = "azul"
        elif delta and "cifra-original" not in flags:
            color = "rojo"
        elif "escala" in flags and not delta:
            color = "verde"

        key = (position, string, offset)
        spelling = note_name(name, alteration)
        cell = cells.setdefault(key, Cell(spelling, delta, {}))
        if spelling != cell.name:
            raise ValueError(
                f"{cell.name} y {spelling} comparten altura en {roman(position)}, cuerda {string}. "
                "Genera esquemas separados si ambas grafías aparecen en el pasaje."
            )
        alternative = "alternativa" in flags
        previous = cell.fingers.get((finger, alternative))
        if previous is None or PRIORITY[color] > PRIORITY[previous.color]:
            cell.fingers[finger, alternative] = Finger(finger, alternative, color)

    if not cells:
        raise ValueError("Indica al menos una nota del pasaje")
    return cells


def offset_range(position, cells, signature):
    used = [offset for _, offset in cells if offset]
    first_stops = [pitch_at_degree(degree + position, signature) - midi
                   for midi, degree in STRINGS.values()]
    fourth_stops = [pitch_at_degree(degree + position + 3, signature) - midi
                    for midi, degree in STRINGS.values()]
    if position == 1:
        return range(0, max(7, *fourth_stops, *used) + 1)
    start = min(first_stops) - 1
    end = max(start + 7, *fourth_stops)
    return range(min(start, *used) if used else start, max([end, *used]) + 1)


def translated(x, y, markup):
    return f"\\translate #'({x:g} . {y:g}) {markup}"


def colored(color, markup):
    rgb = " ".join(f"{channel:g}" for channel in COLORS[color])
    return f"\\with-color #(rgb-color {rgb}) {markup}"


def text(x, y, value, color="negro", size=-2):
    return translated(x, y, colored(color, f"\\fontsize #{size} \\bold \\sans {json.dumps(value, ensure_ascii=False)}"))


def line(x, y, dx, dy, weight=0.85):
    return translated(x, y, colored("linea", f"\\override #'(thickness . {weight}) \\draw-line #'({dx:g} . {dy:g})"))


def finger_labels(x, y, cell):
    labels = []
    for finger in cell.fingers.values():
        value = f"({finger.number})" if finger.alternative else str(finger.number)
        labels.append(colored(finger.color, f"\\bold \\sans \"{value}\""))
    if cell.delta:
        arrow = "↑" if cell.delta > 0 else "↓"
        labels.append(colored("rojo", f"\\bold \\sans \"{arrow * abs(cell.delta)}\""))
    return translated(x, y, "\\fontsize #-3 \\line { " + " ".join(labels) + " }")


def diagram(position, cells, signature, x):
    offsets = offset_range(position, cells, signature)
    key_names = {(NATURAL[name] + alteration) % 12: note_name(name, alteration)
                 for name, alteration in signature.items()}
    elements = [text(x, 0, f"{roman(position)} posición", size=-1), line(x, -0.75, 34.6, 0)]
    for column, (string, (open_pitch, _)) in enumerate(STRINGS.items()):
        left = x + 8.7 * column
        elements.append(text(left + 0.65, -2.4, string.upper(), size=-3))
        elements.append(line(left, -3.05, 0, -1.48 * len(offsets), 1))
        for row, offset in enumerate(offsets):
            y = -4.08 - 1.48 * row
            pitch = (open_pitch + offset) % 12
            cell = cells.get((string, offset))
            if cell:
                name, color = cell.name, "gris" if cell.delta else "negro"
            elif pitch in key_names:
                name, color = key_names[pitch], "negro"
            else:
                name, color = FALLBACK[pitch], "tenue"
            elements.extend([line(left - 0.38, y + 0.3, 0.76, 0), text(left + 0.65, y, name, color)])
            if cell:
                elements.append(finger_labels(left + 4.65, y, cell))

    bottom = 4.2 + 1.48 * (len(offsets) - 1)
    open_cells = [(string, cell) for (string, offset), cell in cells.items() if offset == 0]
    if open_cells and 0 not in offsets:
        for _, cell in open_cells:
            bottom += 1.45
            elements.append(text(x, -bottom, f"{cell.name} al aire", "linea", -3))
            elements.append(finger_labels(x + 8, -bottom, cell))
    return elements, bottom


def markup_row(elements, width, height):
    content = "\n      ".join(elements)
    return (f"\\with-dimensions #'(0 . {width:g}) #'(-{height:g} . 1.2)\n"
            f"    \\overlay {{\n      {content}\n    }}")


def generate(data, columns, name="esquemaDigitacion"):
    signature = key_signature(data["armadura"])
    cells = read_cells(data["notas"], signature)
    positions = sorted({position for position, _, _ in cells})
    rows = []
    heading = data.get("recorrido")
    if heading:
        rows.append("\\fontsize #-2 \\sans " + json.dumps(heading, ensure_ascii=False))
    for index in range(0, len(positions), columns):
        group = positions[index:index + columns]
        elements, bottom = [], 0
        for column, position in enumerate(group):
            used = {(string, offset): cell for (pos, string, offset), cell in cells.items() if pos == position}
            panel, height = diagram(position, used, signature, 37.5 * column)
            elements.extend(panel)
            bottom = max(bottom, height)
        rows.append(markup_row(elements, 37.5 * len(group) - 2, bottom + 0.65))

    rows.append("\\fontsize #-3 \\sans \"Una fila por semitono · Cifras del pasaje · 0 al aire\"")
    colors = {finger.color for cell in cells.values() for finger in cell.fingers.values()}
    legend = []
    if "azul" in colors:
        legend.extend([colored("azul", '\\bold "Azul"'), '"llegada a la cuerda"'])
    if any(cell.delta for cell in cells.values()):
        legend.extend([colored("rojo", '\\bold "↑ ↓"'), '"±1 semitono por flecha respecto a la armadura"'])
    if "verde" in colors:
        legend.extend([colored("verde", '\\bold "Verde"'), '"inicio de escala"'])
    if legend:
        rows.append("\\fontsize #-3 \\sans \\line { " + " \\hspace #0.7 ".join(" ".join(legend[i:i + 2]) for i in range(0, len(legend), 2)) + " }")
    content = "\n  ".join(rows)
    return ("% Generado por esquema_digitacion.py a partir de la ficha del pasaje.\n"
            f"{name} = \\markup \\override #'(baseline-skip . 1.9) \\column {{\n  {content}\n}}\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("datos", type=Path, help="ficha JSON del pasaje")
    parser.add_argument("salida", type=Path, help="inclusión LilyPond .ily")
    parser.add_argument("--columnas", type=int, choices=(1, 2, 3, 4), default=3)
    parser.add_argument("--nombre", default="esquemaDigitacion", help="variable LilyPond de la inclusión")
    args = parser.parse_args()
    if not re.fullmatch(r"[a-zA-Z]+", args.nombre):
        parser.error("--nombre debe contener solo letras ASCII")
    try:
        data = json.loads(args.datos.read_text(encoding="utf-8"))
        args.salida.write_text(generate(data, args.columnas, args.nombre), encoding="utf-8")
    except (OSError, ValueError, KeyError, TypeError) as error:
        parser.exit(1, f"{args.datos}: {error}\n")


if __name__ == "__main__":
    main()
