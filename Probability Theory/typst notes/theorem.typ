#import "@preview/ctheorems:1.1.0": *

#let chnamefmt = it => [#text(style: "normal")[（#it）]]

#let no_fill_thmbox = thmbox.with(
  // inset: (x: 1.2em, top: 0.5em, bottom: 0.5em,left: 0em, right: 0em),
  separator: [#h(0.1em)：#h(0.2em)],

)

#let no_fill_thmplain = thmplain.with(
  // inset: (x: 1.2em, top: 0.5em, bottom: 0.5em,left: 0em, right: 0em),
  separator: [#h(0.1em)：#h(0.2em)],

)

#let corollary = no_fill_thmplain(
  "corollary",
  "Corollary",
  // base: "theorem",
  titlefmt: strong
)

#let example = no_fill_thmplain(
  "example",
  "Example",
  titlefmt : strong,
).with(numbering: none)

#let proof = no_fill_thmplain(
  "proof",
  text("证明", font: "Kai"),
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$],
).with(numbering: none)

#let properties = no_fill_thmbox(
  "properties",
  "性质",
  titlefmt: strong,
  namefmt : chnamefmt,
).with(numbering: none)

#let formula = no_fill_thmplain(
  "formula",
  "公式",
  titlefmt: strong,
  // inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
  namefmt : chnamefmt,
).with(numbering: none)

// #let theorem = thmbox(
//   "theorem",
//   "Theorem",
//   // fill: rgb("#e8e8f8")
//   // fill: rgb("#eeffee")
// )
#let theorem = no_fill_thmplain(
  "theorem",
  "定理",
  titlefmt: strong,
  // inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
  namefmt : chnamefmt,
  // fill: rgb("#e8e8f8"),
    // separator: [#h(0.1em)：#h(0.2em)],
).with(numbering: none)


#let lemma = no_fill_thmplain(
   "lemma",
   "Lemma",
   // fill: rgb("#e8e8f8")
  titlefmt: strong,
  namefmt: chnamefmt
).with(numbering: none)


#let definition = no_fill_thmbox(
   "定义",
   "定义", 
  titlefmt: strong,
  namefmt : chnamefmt,
  separator: [#h(0.1em)：#h(0.2em)],
).with(numbering: none)
