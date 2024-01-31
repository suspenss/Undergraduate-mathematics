#import "@preview/ctheorems:1.1.0": *

#let chnamefmt = it => [#text(style: "normal")[（#it）]]

#let no_fill_thmbox = thmbox.with(
  inset: (x: 1.2em, top: 0.0em, bottom: 0.0em),
  separator: [],
  base_level: 1,
)

#let no_fill_thmplain = thmplain.with(
  // inset: (x: 1.2em, top: 0.5em, bottom: 0.5em,left: 0em, right: 0em),
  separator: [],
  base_level: 1,
)

#let corollary = no_fill_thmbox(
  "corollary",
  "Corollary",
  // base: "theorem",
  titlefmt: strong
)

#let example = no_fill_thmbox(
  "example",
  "Example",
  titlefmt : strong,
).with(numbering: none)

#let proof = no_fill_thmplain(
  "proof",
  "Proof",
  // text("证明", font: "Kai"),
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$],
  separator: [#h(0.2em)_:_#h(0.2em)],
).with(numbering: none)

#let properties = no_fill_thmbox(
  "properties",
  "Properties",
  titlefmt: strong,
  namefmt : chnamefmt,
)

#let formula = no_fill_thmbox(
  "formula",
  "Formula",
  titlefmt: strong,
  // inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
  namefmt : chnamefmt,
)

// #let theorem = thmbox(
//   "theorem",
//   "Theorem",
//   // fill: rgb("#e8e8f8")
//   // fill: rgb("#eeffee")
// )
#let theorem = no_fill_thmbox(
  "theorem",
  "Theorem",
  titlefmt: strong,
  // inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
  namefmt : chnamefmt,
  // fill: rgb("#e8e8f8"),
    // separator: [#h(0.1em)：#h(0.2em)],
)


#let lemma = no_fill_thmbox(
   "lemma",
   "Lemma",
   // fill: rgb("#e8e8f8")
  titlefmt: strong,
  namefmt: chnamefmt
)


#let definition = no_fill_thmbox(
   "definition",
   "Definition", 
  titlefmt: strong,
  namefmt : chnamefmt,
)

#let annotation = no_fill_thmbox(
   "annotation",
   "Annotation", 
  titlefmt: strong,
  namefmt : chnamefmt,
)

#let proposition = no_fill_thmbox(
   "proposition",
   "Proposition", 
  titlefmt: strong,
  namefmt : chnamefmt,
)

#let base = no_fill_thmbox(
   "base",
   "Base", 
  titlefmt: strong,
  namefmt : chnamefmt,
)


#let exercise = base.with(title: "Exercise")
#let axiom = base.with(title: "Axiom")
#let corollary = base.with(title: "Corollary")