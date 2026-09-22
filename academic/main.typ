// Academic CV — Typst version
// Converted from LaTeX (academic/main.tex, structure.tex)
// Original LaTeX template: Compact Academic CV by Dario Taraborelli / Vel
// (https://www.LaTeXTemplates.com, CC BY-NC-SA 3.0)

#set document(title: "Nicholas Mc-Donnell - Curriculum vitae", author: "Nicholas Mc-Donnell")
#set page(
  paper: "a4",
  margin: (top: 3.25cm, bottom: 4cm, left: 3.5cm, right: 3.5cm),
)
#set text(font: "Liberation Serif", size: 11pt)
#set par(justify: false, first-line-indent: 0pt)

#show heading.where(level: 1): it => [
  #v(0.6em)
  #text(size: 13.5pt, weight: "bold")[#it.body]
  #v(0.3em)
]

// "years" margin note, mirroring \newcommand{\years}[1]{\marginnote{...}}
#let years(y, body) = block(spacing: 0.65em)[
  #grid(
    columns: (2.4cm, 1fr),
    column-gutter: 8pt,
    align(right)[#text(size: 8pt, style: "italic")[#y]],
    body,
  )
]

// ---- header ----

#text(size: 20pt, weight: "bold")[Nicholas Mc-Donnell]
#v(1em)

Mobile: +56 9 62061387
#v(0.5em)

Email: #link("mailto:namcdonnell@uc.cl")[namcdonnell\@uc.cl]

#v(1.5em)

Born: January 9, 1999 --- Santiago, Chile \
Nationality: Chilean

= Education

#years("2017-2020")[BSc in Mathematics, Pontificia Universidad Católica de Chile]

= Additional Math Experience

#years("2018-2020")[Organizer of Undergraduate Seminar at UC]
#years("2018-Present")[Organizer of Model Theory Seminar at UC]
#years("2020")[Undergraduate Research Experience under Marcelo Arenas]
- Weisfeiler-Lehman Test, Pebble Games \& $cal(C)_k$
- Graph Neural Networks and its logical expressiveness power

#years("2020-Present")[Research Assistant at IMFD#footnote[Millenium Institute for Foundational Research on Data] under Marcelo Arenas]
- Improving Shapley Value Algorithm over Deterministic Decomposable Circuit
- Implementation of said Algorithm
- Running experiments of said Algorithm performance

= Teaching Assistantship

#years("2018-2020")[Freshman Math Workshop Assistant, UC]
#years("2018")[Calculus I, UC]
#years("2019")[Calculus II, Ring Theory \& Group Theory, UC]
#years("2020")[Pre-calculus \& Real Analysis, UC]
#years("2021")[Cryptography, Data Structures \& Design and Analysis of Algorithms, UC]

= Other

#years("2017-2020")[Representative of UC at ICPC Regional Competition]
#years("2020")[Part of the official UC Competitive Programming team]
#years("2020")[Part of the Mathematics Student Council]

#v(1fr)
#align(center)[
  #text(size: 8pt)[
    Last updated: #datetime.today().display("[month repr:long] [day], [year]") #sym.bullet #link("https://n9199.github.io/academic-cv.pdf")
  ]
]
