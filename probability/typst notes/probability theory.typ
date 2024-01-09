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


== Distrubution of $R.V.$ function

对于离散型随机变量，我们可以先求出取值，在分别对对应的取值求出概率。而对于连续性随机变量，重点是求其密度函数：即已知 $X ~ f_X (x), Y = g(X)$，求 $R.V. Y$ 的分布函数 $f_Y (y)$。

首先介绍根据分布函数求 $R.V. Y$ 的 密度函数的方法：
#formula("distribution function")[\
+ 首先，找到密度函数 $f_Y (y)$ 的分段点，一般有如下两种情况
  + $f_X (x)$ 的分段点，带入 $g(x)$ 后得到的 $y$ 的值，和
  + $y = g(x)$ 的最值
+ 其次，根据以上分段点，求出区间 $(l, r]$ 的 $F_Y (y)$：$ F_Y (y) = P{Y <= y} = P{g(x) <= y} = integral_(l)^r f_X (x) dif x $
+ 最后，对求出的分布函数求导即可得到随机变量 $y$ 的密度函数 $f_Y (y) = F_Y ' (y)$。
]

除此之外，还可以用下方的定理来进行求解：
#theorem()[
  设 $f_X (x)$ 随机变量 $X$ 的密度函数，对于随机变量 $Y$ 有 $Y = g(X)$，且 $g(X)$ 为单调函数，令 $x = h(y)$ 是 $y = g(x)$ 的反函数，$alpha, beta$ 分别是 $g(x)$ 的最小值和最大值。
  
  则 $Y = g(X)$ 的密度函数 $f_Y (y)$ 为： $ f_Y (y) = cases(
    f_X ( h(y))abs(h'(y)) \, space  space &alpha < y < beta, 0 \, &"otherwize"
  ) $
]

= Multiple $R.V.$

== 二维随机变量和联合分布函数
#definition("double R.V.")[
设随机试验 $E$ 的样本空间 $Omega = {e}$，$X = X(e), Y = Y(e)$ 的定义在 $Omega$ 上的随机变量，则 $(X, Y)$ 为定义在 $Omega$ 上的二维随机变量。   
]
#definition("Union Distribution Function")[设 $x, y in RR$，则 $x, y$ 的联合分布函数为事件 ${X <= x}$ 与事件 ${Y <= y}$ 同时发生的概率为二维随机变量的联合分布函数 $
  F(x, y) = P{(X <= x) union (Y <= y)} =^"计作" P{X <= x, Y <= y}
$
]
随机变量的分布函数的几何意义为在二维坐标轴中，$F(x, y)$ 为 $X <= x$ 与 $Y <= y$ 所围成的矩形区域的面积。易得，点 $(X, Y)$ 落在 ${(x, y) | x_1 < x <= x_2, y_1 < y <= y_2}$ 区域的概率为 $F(x_2, y_2) - F(x_2, y_1) - F(x_1, y_2) + F(x_1, y_1)$ 。

== 连续型随机变量
#definition("Density function")[
联合概率密度指的是对于二维随机变量 $(X, Y)$，其概率分布函数为$ F(x, y) = integral_(-oo)^x integral_(-oo)^y f(u, v) dif u dif v $
其中的非负函数 $f(x, y)$ 即为联合概率密度。
  
]
#properties[
有如下性质：
+ 非负性：$f(x, y) >= 0$
+ 规范性：$integral_(-oo)^(oo) integral_(-oo)^(oo) f(u, v) dif u dif v = F(oo, oo) = 1$
+ 设 $G$ 是平面 $x O y$ 上的闭区域，则点 $(X, Y)$ 落在 $G$ 区域上的概率为 $ F{(X, Y) in G} =  limits(integral.double)_G f(x, y) dif x dif y $
]



一些分布的常见形式
+ 均匀分布
$ f(u, v) = cases(1/S_G \, (u, v) in G , 0 \, "其他")  $
+ 二维正态分布

#image("./assets/截屏2023-12-29-21.59.19.svg")

=== 边缘分布

#definition("Distribution function")[
  设二维随机变量 $(X, Y)$ 的联合分布函数为 $F(X, Y)$，$Omega$ 为完备事件组，则
  $F_X (x) = P{X <= x, Omega}, F_Y (y) = P{Omega, Y <= y}$ 分别为 二维随机变量关于 $X$ 或 $Y$ 的边缘分布函数。
]

#definition("Distribution Law")[已知 二维随机变量 $(X, Y)$ 的分布律为 $P{X, Y} = P{X = x_i sect Y = y_i}$ 则关于 $X$ 的边缘分布律为
  $ P_X (x) = sum^i P(x, y_i) $
]

#definition("Density function")[
  设 $(X, Y)$ 的密度函数为 $f(x, y)$ 则关于 $X$ 的边缘密度函数为 
  $ f_X (y) = integral_(-oo)^(+oo) f(x, y) dif y $ 同理 $
  f_Y (x) = integral_(-oo)^(+oo) f(x, y) dif x $ 为关于 $Y$ 的边缘密度函数。
]

=== Condition Distrubution

#definition("law")[
  有二维随机变量 $(X, Y)$ 
  $ P{X = x_i | Y = y_j} = (P{X = x_i, Y = y_j})/(P_Y {Y = y_j}) $ 即为随机变量 $X$ 在 $Y = y_j$ 下的条件分布律
]

#definition("Density function")[
  有二维随机变量 $(X, Y)$ 及其联合概率密度$f(x, y)$，固定 $Y = y$，则随机变量 $X$ 在 $Y = y$ 条件下的概率密度函数为 $ f_(X | Y) = f(x, y)/(f_Y (y))$
]


== Independency

#definition[
  有二维随机变量 $(X, Y)$，$F(x, y) = F_X (y) F_Y (x)$ 满足独立。对于离散型随机变量，独立性在于是否满足 $P(x, y) = P_X (x) P_Y (y)$。对于连续性随机变量，在于其密度函数是否满足 $f(x, y) = f_X (x) f_Y (y)$ 。
]

== 二维连续型随机变量的分布

对于离散型随机变量，依旧是先求取值，再求概率。而对于两个连续型随机变量，我们有如下方法：
#formula("Distribution function method")[
  有二维随机变量 $(X, Y)$ 及其联合概率分布 $f(x, y)$，已知 $Z = g(X, Y)$，则 $Z$ 的概率分布为 $ F_Z (z) = P{Z <= z} = P{g(X, Y) <= z} = P{(X, Y) | g(X, Y) <= z} = limits(integral.double)_G f(x, y) dif x dif y $
]
或使用卷积公式： 
#formula("卷积公式")[
  若随机变量 $X, Z, Y$ 存在 $Z = X + Y$ 关系，则
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [$X, Y$ 不独立], [$X, Y$ 独立], [$f_Z (z) =  integral_(-oo)^(+oo) f(x, z - x) dif x$], [$f_Z (z) = integral_(-oo)^(+oo) f_X (x) f_Y (z- x) dif x$])
]
#proof[
  对于 $Z = X + Y$
  $ F_Z (z) &= integral_(-oo)^(+oo) dif x integral_(-oo)^(z - x) f(x, y) dif y  
  $
令 $y + x = t$ 将二重积分中对 $y$ 的积分换为对 $t$ 的积分得
$
  integral_(-oo)^(+oo) dif x integral_(-oo)^(z) f(x, t - x) dif t 
$
改变积分次序后得 $
  integral_(-oo)^(z) [integral_(-oo)^(+oo)  f(x, t - x) dif x] dif t 
$
要求 $Z$ 的密度函数，对变上限积分求导可得
$
  f_Z (z) =  integral_(-oo)^(+oo) f(x, z - x) dif x
$
若 $(X, Y)$ 独立，又有 $
  f_Z (z) = integral_(-oo)^(+oo) f_X (x) f_Y (z- x) dif x
$]

= 随机变量的数字特征
== 数学期望

#definition("Discrete type")[
对于离散型随机变量 $X$，设 $x_i$ 为其分布律的第 $i$ 个取值，相应概率为 $p_i$，则其数学期望（均值）为：$ E(X) = sum^i x_i p_i $ 
]

#definition("continuous type")[
  若连续型随机变量 $X$ 的密度函数为 $f_X (x)$ 则它的均值为 $ E(X) = integral_(-oo)^(+oo) x f_X (x) dif x $
  若要求 $Y = g(X)$ 的均值，则 $ E(g(X)) = integral_(-oo)^(+oo) g(x) f_X (x) dif x $
  若 $Z = g(X, Y)$ 且二维随机变量 $(X, Y)$ 有联合概率密度 $f(x, y)$ 则 $ E(Z) = integral_(-oo)^(+oo) integral_(-oo)^(+oo) g(x, y) f(x, y) dif x dif y $ 
]

#properties[
  有常数 $C$，随机变量 $X$ 与 $Y$：
  + $E(C) = C$
  + $E(C + X) = C + E(X)$
  + $E(C X) = C E(X)$
  + $E(X + Y) = E(X) + E(Y)$
  + 若 $X, Y$ 独立，则 $E(X Y = E(X) E(Y)$
]

== 方差

#definition[
  方差为随机变量与其均值的距离的平方的均值即 $D(X) = E[(X - E(X))^2]$，其用来表示 $X$ 偏离其均值 $E(X)$ 的程度大小。且方差 $D(X) >= 0$。
]

#formula[
  $D(X) = E(X^2) - E^2(X)$
]

#properties[ $C$ 为常数
  + $D(C) = 0$
  + $D(C X) = C^2 D(X)$
  + $D(X + Y) = D(X) + D(Y) - 2[E(X Y) - E(X) E(Y)]$
]

== 常见形式
#theorem("0 - 1 分布")[
  若随机变量 $X$ 服从 $0 - 1$ 分布，则 $ E(X) = p, D(X) = p(1- p) $
]
#theorem("二项分布")[
  若随机变量 $X$ 服从二项分布即 $X ~ B(n, p)$ 则
  $ E(X) = n p, D(X) = n p (1 - p) $
]
#proof[
  若随机变量 $X ~ B(n, p)$ 则其含义为 $n$ 重伯努利实验中成功的次数即 $X = X_1 + X_2 + ... + X_n$，其中 $X_i$ 表示第 $i$ 次伯努利实验，每次伯努利实验独立且都有相同的 $p$，即 $E(X_i) = p$，则 $ E(X)& = E(X_1 + X_2 + ... + X_n) = n p \ D(X)& = D(X_1 + X_2 + ... + X_n) = n p(1 - p) $
]

#theorem("Passion 分布")[
  若随机变量 $X$ 服从参数为 $lambda$ 的泊松分布即 $X ~ P(lambda)$ 则 $ E(X) = D(X) = lambda $
]

#theorem("Uniform 分布")[
  若 $X ~ U(a, b)$ 则 $ E(X) = (a + b)/2, D(X) = (b - a)^2 / 12 $
]

#theorem("Index 分布")[
  若 $X ~ e(lambda)$ 则 $ E(X) = 1/lambda, D(X) = 1/lambda^2 $
]


#theorem("Normal 分布")[
  若 $X ~ N(mu, sigma^2)$ 则 $ E(X) = mu, D(X) = sigma^2 $
]


=== Appendix figures
#image("./assets/截屏2024-01-08-22.04.16.svg")
#image("./assets/截屏2024-01-08-22.05.04.svg")
#image("./assets/截屏2024-01-08-22.05.38.svg")
#image("./assets/截屏2024-01-08-22.05.58.svg")