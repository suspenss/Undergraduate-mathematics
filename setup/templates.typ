#let project(title: "", authors: (), body, language: "en") = {
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set heading(numbering: "1.1 ")

  set text(font: ("Linux Libertine", "Noto Serif CJK SC"), lang: language, 
  size: 10pt
  )
  show math.equation: set text(font: ("New Computer Modern Math", "Linux Libertine", "Noto Serif CJK SC"))
  show raw: set text(font: "Fira Code", weight: "medium")

  show heading: set block(above: 1.4em, below: 1em)
  show heading.where(level: 1): it => {
    v(1em)
    align(center)[#it]
  }

  // show heading: it => {
  //   v(0.3em)
  //   it
  //   v(0.4em)
  //   // par(text(size: 0.0em, ""))
  // }
  
  // Title row.
  // align(center)[
  //   #block(text(weight: 700, 1.75em, title))
  // ]

  show outline.entry.where(
    level: 1
  ): it => {
    v(14pt, weak: true)

    let no_fill_it = {it.body ;h(1fr); it.page}
    strong(no_fill_it)
  }

  page([
    #align(center)[
      #block(text(weight: 700, 1.75em, title))
    ] 

    #v(1em)
    #align(center)[一个短篇 

    #datetime.today().display("[year] 年 [month] 月 [day] 日")
    ]

    #outline(indent: true, title: [目录], depth: 2)
  ])

  v(1em)
  
  // Main body.
  set terms(tight: true)
  show link: underline
  
  body
}

// #let parbk() = {text()[#v(0.0em, weak: true)];text()[#h(0em)]}
