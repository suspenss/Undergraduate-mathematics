#import "templates.typ": *
#import "theorem.typ": *
#show: thmrules

#show: project.with(
  title: "数理统计笔记",
  authors: (
    "epoche",
  ),
)

= 样本与抽样分布
== 基本概念
#definition("样本")[
  设随机变量 $X$ 服从分布 $F$，若随机变量序列 $X_1, X_2, ..., X_n$ 具有同一分布 $F$ 且相互独立，则称这一随机变量序列为从总体 $F$ 或总体 $X$ 得到的容量为 $n$ 的样本，$x_1, x_2, ..., x_n$ 为 $X$ 的 $n$ 个独立观测值。 
  
  反之，若一随机变量序列是总体 $F$ 的一个样本，则序列中的随机变量同分布为 $F$，且相互独立。
]

#definition("经验分布函数")[
有 样本 $x_1, x_2, ..., x_n$，用$S(x)，-oo < z< oo$ 表示 $x_1, x_2, ..., x_n$ 中不大于 $x$ 的随机变量的个数，定义经验分布函数 $F(z)$ 为 $ F_n(x) = 1/n S(x), quad -oo < x < oo  $
]


=== 统计量
#definition("统计量与统计量的观测值")[
  若有一随机变量序列 $X_1, X_2, ..., X_n$ 是总体 $F$ 的一个容量为 $n$ 的样本，则称不含有位置参数的函数函数 $g(X_1, X_2, ..., X_n)$ 为统计量。

由定义可知，$g(X_1, X_2, ..., X_n)$ 也是一个随机变量，若有 $x_1, x_2, ..., x_n$ 是样本的观测值，则 $g(x_1, x_2, ..., x_n)$ 是随机变量 $g(X_1, X_2, ..., X_n)$ 的观测值。
]

有总体 $X, E(X) = mu, D(X) = sigma^2$，下方为常见的统计量：
#definition("样本平均值")[
  $overline(X) = 1/n limits(sum)_(i = 1)^n X_i$ .

  根据定义可得 $E(overline(X)) = mu, D(overline(X)) = sigma^2 / n$
]
#definition("样本方差")[
  $S^2 = 1/(n - 1) limits(sum)_(i = 1)^n (X_i - overline(X))^2  = 1/(n - 1) (limits(sum)_(i = 1)^n X_i^2 - n overline(X)^2 )$

  根据定义可得，$E(S^2) = D(X) = sigma^2$
]
#definition("样本标准差")[
$S = sqrt(S^2) = sqrt(1/(n - 1) limits(sum)_(i = 1)^n (X_i - overline(X))^2)$
]
#definition("样本 k 阶原点矩")[
  $A_k = 1/n limits(sum)_(i = 1)^n X_i^k ,quad k = 1, 2, 3, ...$
]
#definition("样本 k 阶中心矩")[
  $B_k = 1/n limits(sum)_(i = 1)^n (X_i - overline(X))^k ,quad k = 2, 3, ...$
]


== 抽样分布

抽样分布即为统计量为 $g(X_1, X_2, ..., X_n)$ 的分布，在做题时题目一般会给出提示数据，可以查表求解。

=== $chi^2$ 分布
#definition([ $chi^2$ 分布])[
设样本 $X_1, X_2, ..., X_n$ 相互独立，且均服从 $N(0, 1)$ 分布，则有 $X = X_1^2 + X_2^2 + ...+ X_n^2 $ 服从自由度为 $n$ 的 $chi^2$ 分布，即 $X dash.wave chi^2(n)$。
]

$chi^2$ 分布有如下几条性质：
#properties[
  #table(
    columns: (1fr, 1fr)
  , stroke: 0pt 
  , align: center
  , [
  1. 可加性
  若 $X dash.wave chi^2(n_1), Y dash.wave chi^2(n_2)$ 则 $X + Y dash.wave chi^2(n_1 + n_2)$.
  ], 
  [ 2. 均值与方差
   若 $X dash.wave chi^2(n)$，则 $E(X) = n, D(X) = 2n$.
  ]
  )

    #table(
    columns: 1fr, stroke: 0pt , align: center , 
    [ 3. 上 $alpha$ 分位点
      在 $chi^2$ 分布的密度图形中，当 $x = x_alpha$ 时，$x > x_alpha$ 的面积为 $alpha$，称此点为上 $alpha$ 分位点。此时有 $P{X > x_alpha} = alpha$ . 
    ]
  
  )
]

=== $t$ 分布 

#definition([$t$ 分布])[
  若有 $X dash.wave N(0, 1), Y dash.wave chi^2(n)$ 且相互独立，则 $
  X / sqrt(Y / n) = t dash.wave t(n)
  $
]

=== $F$ 分布

#definition([$F$ 分布])[
  若有 $X_1 dash.wave chi^2(n_1), X_2 dash.wave chi^2(n_2)$ 且相互独立，则 $
    X_1/n_1/(X_2/n_2) = F dash.wave F(n_1, n_2)
  $
]
\

#image("./assets/截屏2024-01-11 16.23.32.png") 
#image("./assets/WeChat7464a5889c0f3cadca18c1f801d247c8.jpg")
