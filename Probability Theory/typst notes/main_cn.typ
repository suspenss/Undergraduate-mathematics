#import "templates.typ": *
#import "@preview/ctheorems:1.1.0": *
#show: thmrules

#show: project.with(
  title: "概率论笔记",
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
  "性质",
  titlefmt: strong,
).with(numbering: none)

#let formula = thmplain(
  "formula",
  "公式",
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
  "定理",
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
   "定义",
   "定义",
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


= 基本概念

== 运算
若 $A$ 代表事件 $A$ 发生, $overline(A)$ 代表事件没有发生，我们定义如下在随机事件上的关系运算：

#table(
  columns:(1fr, 1fr), align: center, stroke: 0pt,

[包含], [并集],
[ $A subset B <=> A -> B$ \ 另外有 $A = B <=> A subset B and B subset A$  ], [$A union B  <=> A or B $],

[交集], [差集],

[$A sect B  <=> A and B $], [$A -  B <=> A  and overline(B)$ \ 另外有 $A - B = A - A B = A overline(B)$  ]
)

对于交集和并集运算，符合以下四种运算律：
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [_交换律_], [结合律 ], 
  [$ A union B = B union A \ A sect B = B sect A $],
  [$ (A union B) union C = A union (B union C)\ (A sect B) sect C = A sect (B sect C) $ \ ], 
  
  [  分配律], [对偶律（德摩根定律）],
  [$ (A union B) sect C = (A sect C) union (B sect C)\ (A sect B) union C = (A union C) sect (B union C)  $], [$ overline(A union B) = overline(A) sect overline(B) \ overline(A sect B) = overline(A) union overline(B) $ ]
)

== 关系 
在事件间，存在如下两种关系：
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [互斥事件], [对立事件], [$A sect B = diameter$], [$A sect B = diameter and A union B = Omega.$])



== 频率和概率

#definition()[\
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [频率], [概率], [$f_n (A) = n_A / n$], [$P(A) =  limits(lim)_(n -> infinity) f_n (A) -> P$])
]

#properties()[
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [非负性], [标准性], [ $0 <= P(A) <= 1$ ], [ $P(Omega) = 1, P(diameter) = 0$ \ \ ]
  
  ,[无限可加性], [互补性],
  [ If $A sect B = diameter$ then $P(A union B) = P(A) + P(B)$], [$P(overline(A)) = 1 - P(A)$]
)
]


概率之间存在如下运算：
  #table(
  columns: 1fr, 
  align: center, 
  stroke: 0pt,
  [_Difference_ \ $P(A - B) = P(A) - P(A B)$. 
  If $B subset A, P(A - B) = P(A) - P(B).$], 

)
  #table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [_Addition_ \ $P(A + B) = P(A) + P(B) - P(A B)$], [_Multiplication_ \ $P(A B) = P(A) P(B | A)$]
)


== 条件概率

#definition()[
如果 $P(A) > 0$，则条件概率为 $P(B | A) = P(A  B) / P(A)$。
]

\
\

依此，我们有两条推广式：
+ $P(B union C | A) = P(B | A) + P(C | A) - P(B C | A)$
+ $P(B - C | A) = P(B | A) - P(B C | A)$

== 全概率与贝叶斯公式

#definition(" 完备事件组 ")[
$S := {A_1, A_2, A_3 , ... , A_n}$ 是一个属于 $Omega$ 的事件组，并且满足
$forall A_1, A_2 subset S, A_1 sect A_2 = diameter, and A_1 union A_2 union A_3 union  ...  union A_n = Omega$，则 $S$ 为一个完备事件组。
]

由定义，我们可以设 $B$ 是一个随机事件, ${A_1,A_2, ..., A_i}$ 是一个完备事件组，我们有：
#formula(" 全概率公式 ")[
  $ P(B)  &= sum_(i = 1)^n P(A_i)P(B | A_i) \ & =sum_(i = 1)^n P(B A_i) $
]
#formula(" 贝叶斯公式 ")[
$ P(A_i | B) = P(A_i B) / P(B) = (P(A_i) P(B | A_i) ) / (sum_(i = 1)^n P(A_i)P(B | A_i)) $
]

== 事件的独立性
若 $A$，$B$ 是相互独立事件，则有  $ P(A | B) = P(A) <=>  P(A B) = P(A) P(B) <=> P(B | A) = P(B | overline(A)) <=> P(B | overline(A)) = P(B) $

且 $A, overline(A), B, overline(B)$ 也相互独立，此外有 
$ "若" A, B, C "互为独立事件"  --> & A, B, C "两两独立"  \
 "若" A, B, C "互为独立事件"  --> & "关于" A, B "的加法，乘法，减法"\ &"以及逆运算" "也分别独立与" C "和" overline(C)
$

== 伯努利概型

#definition(" 伯努利实验 ")[
  The experiment have only two probability result $A, overline(A)$
]

#formula("Binomial probability formula")[
$ binom(n, k) p^k (1 - p)^(n - k)  $
]

= 随机变量及其分布

== $R.V.$ 和 分布函数

$R.V.$ 是一个从随机试验 $E$ 的样本空间 $Omega$ 到 $RR$ 的一个映射。 

== 分布函数

#definition[
设 $X$ 是一个 $R.V.$, $r$ 是任意实数，则称事件 ${X <= r}$ 的概率为 $R.V. space X$ 的分布函数，计作 $F(r)$。
]
分布函数有如下性质：
#properties[
  + $P{x_1 < X <= x_2} = P{X <= x_2} - P{X <= x_1} = F(x_2) - F(x_1).$
  + $F(x)$ 是一个不减函数
  + $F(-oo) = 0, F(+oo) = 1.$
]

== 离散型随机变量及其分布
#example(title: "例子")[
#table(columns: (1fr, 1fr), align: center, stroke: 0pt,

[0 -- 1 分布 

$#table(columns: 3, [x],[0], [1], [P], [$p$], [$1 - p$])$],
[二项分布  

$P{X = k} := binom(n, k)p^k (1 - p)^(n - k), k in {x | x in NN^+ sect [0, n]}$ 
    
计作 $X ~ B(n, p)$
\
\
],
[  泊松分布 

$P{X = k} := (lambda^k e^(-lambda))/(k!) , space (lambda > 0)$ 计作 $X ~ P(lambda)$],
[
  几何分布 
  
  $P{X = k} := (1 - p)^(k - 1) P$
]
)
#table(align: center, columns: 1fr, stroke: 0pt, [  超几何分布
  
  $P{X = k} := (binom(M, k) binom(N - M, n - k)) / binom(N, n), space k in {1, 2, 3, ... min(M, N)}$ 计作 $X ~H(N, M, n)$])


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

=== 正态分布
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

#definition(" 标准正态分布 ")[
当 $mu = 0, sigma^2 = 1, X ~ N(0, 1),x in RR$时，其为标准正态分布。
$
phi(x) =  1/sqrt(2 pi) -e^(x^2/2) \
Phi(x) = F(x) = integral_(-oo)^(x) phi(t) dif t
$ 
]

#definition(" 标准化 ")[
若 $X ~ N(mu, sigma^2)$ 不满足标准正态分布，则 $(X - mu)/sigma ~ N(0, 1)$
]

根据标准化，如果我们想要计算一个满足非标准化的正态分布的随机变量在范围 $(a, b]$上的概率，我们可以 $X$ 先将其标准化为 $(X - mu)/sigma$ 并计算 $Phi((b - mu)/sigma) - Phi((a - mu)/sigma)$ 即可。


#definition("Quantile 分位点")[
  $mu_(alpha)$ 表示 $P{x > mu_(alpha) } = alpha$.\ 并且有 $mu_(1 - alpha) = mu(-alpha)$.
]


== 随机变量的分布

对于离散型随机变量，我们可以先求出取值，在分别对对应的取值求出概率。而对于连续性随机变量，重点是求其密度函数：即已知 $X ~ f_X (x), Y = g(X)$，求 $R.V. Y$ 的分布函数 $f_Y (y)$。

首先介绍根据分布函数求 $R.V. Y$ 的 密度函数的方法：
#formula("根据分布函数法")[\
+ 首先，找到密度函数 $f_Y (y)$ 的分段点，一般有如下两种情况
  + $f_X (x)$ 的分段点，带入 $g(x)$ 后得到的 $y$ 的值，和
  + $y = g(x)$ 的最值
+ 其次，根据以上分段点，求出区间 $(l, r]$ 的 $F_Y (y)$：$ F_Y (y) = P{Y <= y} = P{g(x) <= y} = integral_(l)^r f_X (x) dif x $
+ 最后，对求出的分布函数求导即可得到随机变量 $y$ 的密度函数 $f_Y (y) = F_Y ' (y)$。
]

除此之外，还可以用下方的定理中的公式来进行求解：
#theorem()[
  设 $f_X (x)$ 随机变量 $X$ 的密度函数，对于随机变量 $Y$ 有 $Y = g(X)$，且 $g(X)$ 为单调函数，令 $x = h(y)$ 是 $y = g(x)$ 的反函数，$alpha, beta$ 分别是 $g(x)$ 的最小值和最大值。则 $Y = g(X)$ 的密度函数 $f_Y (y)$ 为： $ f_Y (y) = cases(
    f_X ( h(y))abs(h'(y)) \, space  space &alpha < y < beta, 0 \, &"otherwize"
  ) $
]

= 多维 $R.V.$

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

== 边缘分布

#definition("Distribution function")[
  设二维随机变量 $(X, Y)$ 的联合分布函数为 $F(X, Y)$，$Omega$ 为完备事件组，则
  $F_X (x) = P{X <= x, Omega}, F_Y (y) = P{Omega, Y <= y}$ 分别为 二维随机变量关于 $X$ 或 $Y$ 的边缘分布函数。
]

#definition("Distribution Law")[已知 二维随机变量 $(X, Y)$ 的分布律为 $P{X, Y} = P{X = x_i sect Y = y_i}$ 则关于 $X$ 的边缘分布律为
  $ P_X (x) = sum^i P(x, y_i) $
]

#definition("Density function")[
  设 $(X, Y)$ 的密度函数为 $f(x, y)$ 则关于 $X$ 的边缘密度函数为 
  $ f_X (x) = integral_(-oo)^(+oo) f(x, y) dif y $ 同理 $
  f_Y (y) = integral_(-oo)^(+oo) f(x, y) dif x $ 为关于 $Y$ 的边缘密度函数。
]

== 条件分布

#definition("law")[
  有二维随机变量 $(X, Y)$ 
  $ P{X = x_i | Y = y_j} = (P{X = x_i, Y = y_j})/(P_Y {Y = y_j}) $ 即为随机变量 $X$ 在 $Y = y_j$ 下的条件分布律
]

#definition("Density function")[
  有二维随机变量 $(X, Y)$ 及其联合概率密度$f(x, y)$，固定 $Y = y$，则随机变量 $X$ 在 $Y = y$ 条件下的概率密度函数为 $ f_(X | Y) = f(x, y)/(f_Y (y))$
]


== 独立性

#definition[
  有二维随机变量 $(X, Y)$，$F(x, y) = F_X (y) F_Y (x)$ 满足独立。对于离散型随机变量，独立性在于是否满足 $P(x, y) = P_X (x) P_Y (y)$。对于连续性随机变量，在于其密度函数是否满足 $f(x, y) = f_X (x) f_Y (y)$ 。
]

== 二维连续型随机变量的分布

对于离散型随机变量，依旧是先求取值，再求概率。而对于两个连续型随机变量，我们有如下方法：
#formula(" 分布函数法 ")[
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

== 协方差

#definition(" 协方差 ")[
  有二维随机变量 $(X, Y)$，称 $E[(X - E(X)) (Y - E(Y))]$ 为随机变量 $(X, Y)$ 的协方差，通常计作 $"cov"(X, Y)$ 即 $ "cov"(X, Y) &= E[(X - E(X)) (Y - E(Y))] \ &= E(X Y) - E(X) E(Y) $
  
特别的，相同变量的协方差为其方差 $"cov"(X, X) = D(X)$。 

] 
已知方差的性质 3：$D(X + Y) = D(X) + D(Y) - 2[E(X Y) - E(X) E(Y)]$，我们将协方差的计算公式带入可得到 $D(X + Y) = D(X) + D(Y) - 2"cov"(X, Y)$。

协方差有以下性质 
#properties[
#table(
  columns: (1fr, 1fr), 
  align: center, 
  stroke: 0pt,
  [
    1. $"cov"(X, Y) = "cov"(Y, X)$
  ],
  
   [
    2. $"cov"(a X, b Y) = a b "cov"(X, Y)$
      \ $a, b$ 为常数 \ \
   ],
   [
    3. $"cov"(X + Y, Z) = "cov"(X, Z) + "cov"(Y, Z)$
   ]
   ,
   [
    4. 若 $X, Y$ 相互独立，则 
    $"cov"(X, Y) = 0$
   ]
  )
]

#definition(" 相关系数 ")[
  有随机变量 $X, Y$，则其相关系数为：
  $ rho_(X Y) = "cov"(X, Y)/(sqrt(D(X)) sqrt(D(Y))) $
]

相关系数有以下性质
#properties[
+ $-1 <= rho_(X Y) <= 1$

+ 相关性 \ 
      
      + 若相关系数 $rho_(X Y) = 0$ 则称 $X, Y$ 不相关
      + 若 $rho_(X Y) = 1$，则称 $X, Y$ 为正相关，$y = a x + b, a > 0$
      + 若 $rho_(X Y) = -1$，则称 $X, Y$ 为负相关，$y = a x + b, a < 0$
]

= 大数定律和中心极限定理

#definition(" 切比雪夫不等式 ")[
  有随机变量 $X$ 及其均值 $E(X)$ 方差 $D(X)$，存在任意正数 $epsilon$ 有 
  $ P{ | X - E(X) | >= epsilon  } <= D(X) / epsilon^2 $
  另有   $ P{ | X - E(X) | < epsilon  } >= 1- D(X) / epsilon^2 $
]

#definition(" 切比雪夫大数定律 ")[
设 $X_1, X_2, ..., X_n$ 是相互独立的随机变量序列，且 $E(X_i), D(X_i)$ 均存在，且 $D(X_i) <= C$，记 $overline(X) = 1/n limits(sum)_(i = 1)^n X_i$ 则对于任意正数 $epsilon$，有
$ &lim_(n -> +oo) P{ | overline(X) - E(overline(X)) | < epsilon} = 1 \ <=> & overline(X) "依概率收敛到" E(overline(X)) "即：" overline(X) -->^P E(overline(X)) $
]

#definition( " 伯努利大数定律 " )[
设 $n_A$ 为 $n$ 次独立重复试验中事件 $A$ 发生的次数，且 $P(A) = p$，则对于任意正数 $epsilon$，有 $
  &lim_(n -> +oo) P{ | n_A/n - p | < epsilon} = 1
  \
  <=> & n_A / n -->^P p
$
]

#definition(" 辛钦大数定律 ")[
  有随机变量序列 $X_1, X_2, ..., X_n$，随机变量间相互独立且服从同一分布，$E(X_i)$ 存在，则对于任意正数 $epsilon$ 有
   $ 
    &lim_(n -> +oo) P{ | overline(X) - E(overline(X)) | < epsilon } = 1 
   \ 
   <=> & overline(X) -->^P E(overline(X))
   $
]

= 附录1：常见的分布类型的期望与方差
#image("./assets/截屏2024-01-08-22.04.16.svg")
#image("./assets/截屏2024-01-08-22.05.04.svg")
#image("./assets/截屏2024-01-08-22.05.38.svg")
#image("./assets/截屏2024-01-08-22.05.58.svg")