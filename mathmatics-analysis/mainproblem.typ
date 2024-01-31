#import "./../setup/templates.typ": *
#import "./../setup/theorem.typ": *
#show: thmrules

#show: project.with(
  title: "Mathmatics Analysis", authors: ("epoche",), language: "ch", outl: [
    #outline(indent: true, title: "目录", depth: 2)
  ],
)

#show math.ast: math.thin
#let obey = math.tilde
#let vb = $bold(beta)$
#let va = $bold(alpha)$
#let ve = $bold(e)$

#let tem = theorem
#let def = definition
#let prf = proof
#let emp = example
#let ant = annotation
#let pos = proposition
#let lem = lemma
#let prt = properties

#let exr = exercise

= 自然数
== 加法 

#exr[
  证明自然数加法的结合律。
]
#prf[
  对 $b$ 进行数学归纳法，当 $b = 0$ 时，等式为 $(a + 0) + c = a + (0 + c)$，由加法定义及加法的交换律可得
  $a + c = a + c$，即 $b = 0$ 时得证。现归纳性地假设 $(a + b) + c = a + (b + c)$，待证
  $(a + "succ" b) + c = a + ("succ" b + c)$，根据交换律及加法定义可以将其化简为 
  $"succ" (a + b) + c = a + "succ" (b + c)$，进一步化简为 $"succ" (a + b + c) = "succ" (a + b + c)$，等式两边相等。
]

#exr[
  证明引理 2.2.10 。
]
#prf[
  对 $a$ 进行归纳法，当 $a = 1$ 时，$"succ" b = 1$，式子可以写成 $b + 1 = 0 + 1$，由消去律可以得到
  $b = 0，b in NN$，现归纳性地假设 $forall thin a in ZZ^+， exists thin b in NN，"succ" b = a$，需证明
  $"succ" b = "succ" a$，此时 $b = a，b in NN$。
]

#exr[
  证明命题 1.1 自然数的序的基本性质。
]

#exr[
  证明命题 2.2.13 证明中标注了（为什么？）的三个命题。
]

#exr[
  证明命题 2.2.14 。
]
