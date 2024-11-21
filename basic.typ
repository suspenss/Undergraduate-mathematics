#import "./setup/main.typ": *

// #show math.equation: set text(font: "New Computer Modern Math")
// #show math.equation: set text(font: "Libertinus Math")
#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show math.ast: math.thin
#let obey = math.tilde

#show: project.with(
  title: "Basic Knoweledge",
  authors: (
    "suspen",
  ),
  language: "ch",
  outl: [
    #outline(indent: true, title: "目录", depth: 2)
  ],
)

