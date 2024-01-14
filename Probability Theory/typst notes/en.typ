#import "templates.typ": *
#import "@preview/ctheorems:1.1.0": *
#show: thmrules

#show: project.with(
  title: "Probability Theory quick notes",
  authors: (
    "epoche",
  ),
)

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
  "Properties",
  titlefmt: strong,
).with(numbering: none)

#let formula = thmplain(
  "formula",
  "Formula",
  titlefmt: strong,
  inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
)

// #let theorem = thmbox(
//   "theorem",
//   "Theorem",
//   // fill: rgb("#e8e8f8")
//   // fill: rgb("#eeffee")
// )
#let theorem = thmplain(
  "theorem",
  "Theorem",
  titlefmt: strong,
  inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
)

// #let definition = thmbox(
//    "definition",
//    "Definition",
//    // fill: rgb("#e8e8f8")
//   // titlefmt: strong,
//   namefmt: it => [#text(style: "italic")[(#it)]],
// )

#let definition = thmplain(
   "definition",
   "Definition",
  titlefmt: strong,
  inset: (x: 1.2em, top: 0.5em, bottom: 0.5em),
)

#let lemma = thmplain(
   "lemma",
   "Lemma",
   // fill: rgb("#e8e8f8")
  titlefmt: strong,
  namefmt: it => [#text(style: "italic")[(#it)]],
)

// #show math.equation: set text(font: "New Computer Modern Math")
// #show math.equation: set text(font: "Libertinus Math")


= Basic Concept
== Random event


随机试验是具有 Repeatability#footnote[The experiments both under the same confition.]，Predictability，以及 Nondeterminacy几种特性的实验。

#definition()[\
_Sample space_ :
  A set contains all possible results of random experiment $E$ is $Omega$ 

_Sample point_ :
  A element $e$ or $omega$ of a sample space $E$, $e in E$.
  
_Random event_ :
  A subset of a sample space is random event $A$, $A in E$. 

If a sample point in event is occur, the event is occur.

_Certain event_ : $Omega$
_Impossible event_ : $diameter$
]

== Operations
Note $A$ is event happen, $overline(A)$ is not happen.

#definition[\
_Inclusion_ : $A subset B <=> A "happen" -> B "happen"$._comment_ : $A = B <=> A subset B and B subset A$

_Union_ : $A union B "happen" <=> A "hapen" or B "happen"$.

_Intersection_ : $A sect B <=> A B <=> "event " A, B" occurs simultaneously" <=> A "happen" and B "happen"$

_Difference_ : $A -  B <=> A "happen" and B "not happen"$
]

comment: $A - B = A - A B = A overline(B)$  


#definition()[
  
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [_Commutative law_], [_Associative law_ ], 
  [$ A union B = B union A, A sect B = B sect A $],
  [$ (A union B) union C = A union (B union C)\ (A sect B) sect C = A sect (B sect C) $ ], 
  
  [ _Distributive law_], [_Duality law_],
  [$ (A union B) sect C = (A sect C) union (B sect C)\ (A sect B) union C = (A union C) sect (B union C)  $], [$ overline(A union B) = overline(A) sect overline(B) \ overline(A sect B) = overline(A) union overline(B) $ ]
)
]

== Relationships 
#definition[
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [_Exclusion event_], [_Complementary events_], [$A sect B = diameter$], [$A sect B = diameter and A union B = Omega.$])

]


== Probability and Frequency

#definition()[\
_Frequency_ : $f_n (A) = n_A / n$

_Probability_ : $P(A) =  limits(lim)_(n -> infinity) f_n (A) -> P$
]

#properties()[\
_Non-negative_ : $0 <= P(A) <= 1$ 

_Standardability_ : $P(Omega) = 1, P(diameter) = 0$ 

_Finite additivity_ : If $A sect B = diameter$ then $P(A union B) = P(A) + P(B)$

_Complementarity_ : $P(overline(A)) = 1 - P(A)$
]

#formula()[\
  _Difference_ : $P(A - B) = P(A) - P(A B)$. 
  If $B subset A, P(A - B) = P(A) - P(B).$\

_Addition_ : $P(A + B) = P(A) + P(B) - P(A B)$

_Multiplication_ : $P(A B) = P(A) P(B | A)$

]

// == Classic and Geometric scheme

== Condition probability

#definition()[
If $P(A) > 0$ then condition probability is $P(B | A) = P(A B) / P(A)$.
]

/ Generalization:
  + $P(B union C | A) = P(B | A) + P(C | A) - P(B C | A)$
  + $P(B - C | A) = P(B | A) - P(B C | A)$

== Total probability and Bayesian formula

#definition("Complete set of events")[
$S := {A_1, A_2, A_3 , ... , A_n}$ is a events set of $Omega$
$forall A_1, A_2 subset S, A_1 sect A_2 = diameter, and A_1 union A_2 union A_3 union  ...  union A_n = Omega$
]

$B$ is a event, ${A_1,A_2, ..., A_i}$ is a Complete set of events.
#formula("Total probability")[
  $ P(B)  &= sum_(i = 1)^n P(A_i)P(B | A_i) \ & =sum_(i = 1)^n P(B A_i) $
]
#formula("Bayesian formula")[
$ P(A_i | B) = P(A_i B) / P(B) = (P(A_i) P(B | A_i) ) / (sum_(i = 1)^n P(A_i)P(B | A_i)) $
]

== Independence of events
If $A$ and $B$ are independent, then $ P(A | B) = P(A) <=>  P(A B) = P(A) P(B) <=> P(B | A) = P(B | overline(A)) <=> P(B | overline(A)) = P(B) $

If $A$ and $B$ are independent each other, then $A, overline(A), B, overline(B)$ are independent each pair. And 
$ "If" A, B, C "are independent"  --> & A, B, C "can independent each pair"  \
 "If" A, B, C "are independent"  --> & "The addition, difference, multiplication "\ &"and inverse of" A, B "are independent with" C "and" overline(C)
$

== Bernoulli scheme

#definition("Bernoulli experiment")[
  The experiment have only two probability result $A, overline(A)$
]

#formula("Binomial probability formula")[
$ binom(n, k) p^k (1 - p)^(n - k)  $
]

= Random variables and their Distribution

== $R.V.$ and Distribution function

$R.V.$ 是一个从随机试验 $E$ 的样本空间 $Omega$ 到 $RR$ 的一个映射。 

== Distribution function

#definition[
设 $X$ 是一个 $R.V.$, $r$ 是任意实数，则称事件 ${X <= r}$ 的概率为 $R.V. space X$ 的分布函数，计作 $F(r)$。
]
分布函数有如下性质：
#properties[
  + $P{x_1 < X <= x_2} = P{X <= x_2} - P{X <= x_1} = F(x_2) - F(x_1).$
  + $F(x)$ 是一个不减函数
  + $F(-oo) = 0, F(+oo) = 1.$
]

== Discrete type random variable

#example[

  0 - 1 :  $#table(columns: 3, [x],[0], [1], [P], [$p$], [$1 - p$])$

  Binomial :  $P{X = k} := binom(n, k)p^k (1 - p)^(n - k), k in {x | x in NN^+ sect [0, n]}$ marked $X ~ B(n, p)$

  Poisson :  $P{X = k} := (lambda^k e^(-lambda))/(k!) , space (lambda > 0)$ marked $X ~ P(lambda)$

  超几何 :  $P{X = k} := (binom(M, k) binom(N - M, n - k)) / binom(N, n), space k in {1, 2, 3, ... min(M, N)}$ marked $X ~H(N, M, n)$

  Geometry :  $P{X = k} := (1 - p)^(k - 1) P$
]


#theorem("Passion's theorem")[
  当 $X ~ B(n, p)$ 且 $n$ 充分大，$p$ 充分小时
  $
  binom(n, k)p^k (1 - p)^(n - k) approx (lambda^k e^(-lambda)) / (k!), lambda = n p
  $
]

== 连续型 $R.V.$

#definition("distribution function")[
$
F(X) = integral_(-oo)^x f(t) dif t
$ 
其中 $f(t)$ 是概率密度函数，$F(x)$ 是分布函数
]


#formula("Range probability")[
  $F{ a < X < b} = integral_a^b f(x) dif x$
]  

#definition("Uniform distribution")[
$ f(x) = cases(1/(b - a) \, space  &b < x < a, 0 \,  &"otherwise") $ 
]
#definition("Index")[
$ f(x) = cases(1/lambda e^(-x/lambda)\, space & x > 0, 0\, & "otherwize") $  
    指数分布具有无记忆性，即 $P{x > t + T | x > t} = P{x > T}$ 。
]

=== Normal Distribution
#definition("Normal")[
  Marked $X ~ N(mu, sigma^2)$, $sigma > 0&$
  $ f(x) = 1/(sqrt(2 pi) sigma) e^(-(x-mu)^2/(2 sigma^2)) , space x in RR $
]

#formula[
  $ integral^(+oo)_(-oo) e^(-x^2/A) dif x = sqrt(A pi) , space A > 0 $
]

#proof[
  设 $X ~ N(0, A/2)$, 因为概率分布函数具有规范性 $F(+oo) = 1$ 即 $integral_(-oo)^(+oo) f(x) = 1.$ 带入得
  $ integral_(-oo)^(+oo) 1/(sqrt(A pi)) e^(-x^2 / A) dif x = 1 \ 1/(sqrt(A pi)) integral_(-oo)^(+oo)  e^(-x^2 / A) dif x = 1 \ integral_(-oo)^(+oo)  e^(-x^2 / A) dif x = sqrt(A pi)
  $
]

#definition("Std Normal Distribution")[
 When the $mu = 0, sigma^2 = 1, X ~ N(0, 1)$, it is a std normal dist..., $x in RR$.
$
phi(x) =  1/sqrt(2 pi) e^(x^2/2) \
Phi(x) = F(x) = integral_(-oo)^(x) phi(t) dif t
$ 
]

If $X ~ N(mu, sigma^2)$ is not statifing the Std Normal distribution, $(X - mu)/sigma ~ N(0, 1)$, so that if we want calculate the probability of range $(a, b]$, we can standardlize the $X$ to $(X - mu)/sigma$ and calculate the $Phi((b - mu)/sigma) - Phi((a - mu)/sigma)$.

#definition("Quantile")[
  $mu_(alpha)$ is representation the $P{x > mu_(alpha) } = alpha$.\ and $mu_(1 - alpha) = mu(-alpha)$.
]
