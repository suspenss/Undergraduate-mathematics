#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center)
  set heading(numbering: "1.1 ")

  set text(font: ("Linux Libertine", "Noto Serif CJK SC"), lang: "en")
  
  show heading: it => {
    v(0.3em)
    it
    v(0.4em)
    // par(text(size: 0.0em, ""))
  }
  
  // Title row.
  // align(center)[
  //   #block(text(weight: 700, 1.75em, title))
  // ]

  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }

  page([
    #align(center)[
      #block(text(weight: 700, 1.75em, title))
    ] 
    #v(3em)
    #outline(indent: true, title: "目录", depth: 2)
  ])

  // outline(fill: none, indent: true, title: "目录", depth: 2)
  
  v(1em)
  
  // Main body.
  // set par(justify: true, first-line-indent: 1.8em)
  set terms(tight: true)
  show link: underline
  show raw: set text(font: "Fira Code", weight: "medium")
  
  show math.equation: set text(font: ("New Computer Modern Math", "Linux Libertine", "Noto Serif CJK SC"))
  
  body
}

#let parbk() = {text()[#v(0.0em, weak: true)];text()[#h(0em)]}

