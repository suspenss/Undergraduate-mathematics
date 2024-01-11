#import "@preview/ctheorems:1.1.0": *

#let chnamefmt = it => [#text(style: "normal")[（#it）]]

#let corollary = thmplain(
  "corollary",
  "Corollary",
  // base: "theorem",
  titlefmt: strong
)

#let example = thmplain(
  "example",
  "Example",
  titlefmt : strong,
).with(numbering: none)

#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)

#let properties = thmplain(
  "properties",
  "性质",
  titlefmt: strong,
  namefmt : chnamefmt,
).with(numbering: none)

#let formula = thmplain(
  "formula",
  "公式",
  titlefmt: strong,
  inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
  namefmt : chnamefmt,
)

// #let theorem = thmbox(
//   "theorem",
//   "Theorem",
//   // fill: rgb("#e8e8f8")
//   // fill: rgb("#eeffee")
// )
#let theorem = thmplain(
  "theorem",
  "定理",
  titlefmt: strong,
  inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
  namefmt : chnamefmt,
)


#let definition = thmbox(
   "定义",
   "定义",
  titlefmt: strong,
  inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
  namefmt : chnamefmt,
)

#let lemma = thmplain(
   "lemma",
   "Lemma",
   // fill: rgb("#e8e8f8")
  titlefmt: strong,
  namefmt: chnamefmt
)