#let copertina(
  doc,
  link_website: "http://tecweb.studenti.math.unipd.it/asoranzo/index.php",
  link_text: "tecweb.studenti.math.unipd.it/asoranzo/index.php",
) = {
  set text(lang: "it")
  set list(indent: 1em)
  set enum(indent: 1em)
  set align(center)
  
  text(25pt, weight: "bold", fill: black, font: "Liberation Sans")[UNI COOKED \ ]

  circle(radius: 7em, fill: rgb("#302E8E"))[
    #image("../img_raw/def-profile.png", height: 100%)
  ]

  v(1.5em)


  show grid.cell.where(x: 0): cell => align(right, cell)
  show grid.cell.where(x: 1): cell => align(left, cell)

  text(15pt, weight: "bold", fill: black, font: "Liberation Sans")[
    #box(
      width: 80%,
      table(
        stroke: none,
        columns: (50%, 50%),
        inset: 8pt,
        table.cell(colspan: 2, stroke: none)[*AUTORI* \ \ ],
        [Andrea Precoma], [2068227],
        [Andrea Soranzo], [2075539],
        [Gabriele Magnelli], [2075542],
        [Matteo Schievano], [2075537]
      ),
    )
  ]

  v(1em)

  link(link_website)[#text(fill: navy, size: 1.3em)[#underline(link_text)]]

  v(1em)

  text(13pt, fill: black, font: "Liberation Sans")[
    #box(
      width: 50%,
      table(
        columns: (auto, auto, auto),
        inset: 0.5em,
        table.cell(colspan: 3, stroke: none)[*DATI DI ACCESSO* \ \ ],
        [*Nome utente*], [*Password*], [*Tipo*],
        [user], [user], [DAD],
        [GGGaggi], [GGGaggi], [Pendolare],
        [Tony], [Tony], [In sede],
        [UgoFantozzi], [UgoFantozzi], [Fuorisede],
      ),
    )

    \ *Referente* \
    Andrea Soranzo \
    #link("mailto:andreajesus.soranzomendez@studenti.unipd.it")[#text(fill: navy, size: 1em)[#underline("andreajesus.soranzomendez@studenti.unipd.it")]]

  ]


  set text(12pt, font: "DejaVu Serif")

  set par(justify: true)

  set page(
    numbering: "1",
    header: [
      #set text(12pt, font: "DejaVu Serif")
      #grid(
        columns: (1fr, 1fr),
        align(left)[UNI COOKED],
        align(right)[Relazione],
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