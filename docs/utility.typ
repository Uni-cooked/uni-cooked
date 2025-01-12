#let copertina(
  doc
) = {
  set text(lang: "it")
  set list(indent: 1em)
  set enum(indent: 1em)
  set align(center)
  
  text(25pt, weight: "bold", fill: black, font: "Liberation Sans")[RELAZIONE DI PROGETTO \ ]

  circle(radius: 10em, fill: rgb("#302E8E"))[
    #image("../src/asset/img/def-profile.png", height: 100%)
  ]

  v(1.5em)
  text(20pt, weight: "bold", fill: black, font: "Liberation Sans")[UNI COOKED \ \ ]


  show grid.cell.where(x: 0): cell => align(right, cell)
  show grid.cell.where(x: 1): cell => align(left, cell)

  text(15pt, weight: "bold", fill: black, font: "Liberation Sans")[
    #box(
      width: 80%,
      table(
        stroke: none,
        columns: (50%, 50%),
        inset: 8pt,
        [Andrea Precoma], [xxxxxxx],
        [Andrea Jesus Soranzo Mendez], [xxxxxxx],
        [Gabriele Magnelli], [xxxxxxx],
        [Matteo Schievano], [xxxxxxx]
      ),
    )
  ]

  set text(12pt, font: "DejaVu Serif")

  set page(
    numbering: "1",
    header: [
      #set text(12pt, font: "DejaVu Serif")
      #grid(
        columns: (1fr, 1fr),
        align(left)[UNI COOKED], align(right, "Relazione di progetto"),
      )
      #line(length: 100%)
    ],
    footer: [
      #set text(12pt, font: "DejaVu Serif")
      #set align(center)
      #line(length: 100%)
      #context [
        Pagina #counter(page).display(page.numbering) di #counter(page).final().first()
      ]
    ],
  )

  set align(left)
  set heading(numbering: "1.")
  counter(page).update(1)
  pagebreak()

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }
  outline(title: [#v(2em) INDICE #v(3em)], indent: auto)
  pagebreak()

  // Resto del documento
  doc
}