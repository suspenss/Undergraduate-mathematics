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

#let example = thmbox("example", "Example", fill: rgb("eeeeee")).with(numbering: none)

#let remark = thmbox("remark", "Remark", fill: rgb("#eeff")).with(numbering: none)

#let knowledge = thmbox("knowledge point", "Knowledge Point").with(numbering: none)

#let proof = thmproof("proof", "Proof", namefmt: emph)

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


= 不等式

#theorem[
  $ 2 / (1/a + 1/b) <= sqrt(a b) <= (a + b) / 2 <= sqrt((a^2 + b^2) / 2), space (a, b > 0) $
]


= 无穷小与无穷大
#example("Equivalent Infinitesimal")[
  + $sin x ~ x$
  + $tan x ~ x$
  + $arcsin x ~ x$
  + $arctan x ~ x$
  + $ln(1 + x) ~ x$
  + $e^x - 1 ~ x$
  + $a^x -1 ~ x ln a$
  + $1 - cos x ~ 1/2 x^2$
  + $(1 + x)^a - 1 ~ a x$ 
]

#remark[
  无界不一定要有无穷大的量，如 $f(x) = x sin x$.
]

#theorem[
  $lim f(x)/g(x) = A, "if one of" f(x) "and" g(x) "equal to" 0, "the another is" 0.$ 
]
#proof[
   $f(x) = f(x) / g(x) g(x), lim f(x) = lim f(x) / g(x) lim g(x) = A times lim g(x) = A times 0 = 0. $
]