#import "./../setup/templates.typ": *
#import "./../setup/theorem.typ": *
#show: thmrules

// #show math.equation: set text(font: "New Computer Modern Math")
// #show math.equation: set text(font: "Libertinus Math")

#show: project.with(
  title: "Mathmatics Analysis", authors: ("epoche",), language: "ch",  outl: [
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
#let axm = axiom 

#align(center)[参考书目为 《陶哲轩实分析》]

#let align_enums = it => grid(columns : (1em, 1fr, 1em), [], [#it], [])

= 自然数
== 皮亚诺公理
#tem(title: "Axioms", "皮亚诺自然数公理")[
  #grid(columns : (1em, 1fr, 1em), [], [
    1. $0$ 是自然数
    + 每个自然数 $n$ 都有一个后继，计作 $"succ" n$，也是自然数
    + $0$ 不是任何自然数的后继
    + 当且仅当 $"succ" n = "succ" m$ 时，$n = m$
  ], [])
]<Peano-Axiom>

@Peano-Axiom[Axioms] 中第三第四条公理是为了处理自然数的绕回状况，是对前两条公理的强化。

#tem(title: "Axiom", [数学归纳法原理])[
  $P(n)$ 表示自然数 $n$ 的某一性质，若 $P(0)$ 为真，$P(n)$ 为真，则有 $P("succ" n)$ 为真
  ，即对于任意自然数 $n$ 都有 $P(n)$ 为真。
]<nat-induction>

自然数的数学归纳法原理中所指的性质并不是确定的，该条原理也并非是一个独立的公理而是一种公理模式。

假设存在数系 $NN$， 若满足 @Peano-Axiom[Axiom] 以及 @nat-induction[Axiom]，我们就称这个数系为自然数。

在自然数的基础上，我们可以递归的定义序列。序列是一列自然数，其下标，也就是索引值也是自然数，序列有基值，是一个常数，也有一个函数 $f : NN -> NN$，通过这个函数得到数列中这一项的后继元素的值。更准确的，有命题 

#pos([序列的递归定义])[
  有函数 $f : NN -> NN$，以及序列基值 $a_0 = c$，对于任意自然数 $n$，都可以确定唯一的 $a_("succ" n) = f(a_n)$ 。
]<序列的递归定义>

== 加法

#def([加法])[
对于任意一个自然数 $m$，$0 + m = m$，假设我们已经定义了 $n + m$，我们有 $("succ" n) + m = "succ" (m + n)$ 。
]<nat-addition>

#lem[
对于任意自然数 $n$，有 $n + 0 = n$ 成立。
]

#prf[
  由 @nat-addition 可知，对于任意自然数 $m$，有$0 + m = m$，所以有 $0 + 0 = 0$，假设 $n + 0 = n$ 成立，则需证明 $"succ" n + 0 = "succ" n$，由加法定义可知 $("succ" n) + 0 = "succ" (n + 0)$，将 $n + 0 = n$ 代入可得 $"succ" (n + 0) = "succ" n$ 。
]

#lem[
  对于任意自然数 $m，n$ 有 $m + ("succ" n) = "succ" (m + n)$ 。
]

证明时对 $m$ 进行数学归纳法即可。

#pos([交换律])[
  $forall thin n， m in NN， n + m = m + n$
]

固定 $n$ 对 $m$ 进行数学归纳法即可证明。

#pos([结合律])[
  $forall thin a， b， c in NN， (a + b) + c = a + (b + c)$
]

#pos([消去律])[
  $forall thin a， b， c in NN， " if" a + b = a + c， " then" b = c$
]

=== 正整数 

#def([正整数])[
  正整数系中所有的元素都是非 $0$ 的自然数，计作 $ZZ^+$ 。
]

#pos[
  $forall thin a in ZZ^+， b in NN， a + b in ZZ^+$
]

#corollary[
  $forall thin a， b in NN， " if" a + b = 0， " then" a = 0， b = 0$
]

#lem[
  $forall thin a in ZZ^+， exists thin b in NN， "succ" b = a$ 
]

=== 自然数的序

#def([自然数的序])[
  $forall thin n， m， a in NN$，若 $n = m + a$，则称 $n >= m$ 或 $m <= n$，若 $n >= m$ 
  并且 $n != m$，则称 $n > m$ 或 $m < n$ 。
]

#prt([自然数的序的基本性质])[
  #align_enums[
  #set enum(numbering: "(a)",number-align: start + bottom)

    + 自反性：$a >= a$
    + 传递性：若 $a >= b， b >= c$，则 $a >= c$
    + 反对称性：若 $a >= b， b >= a$，则 $a = b$
    + 加法不变性：若 $a >= b$，则 $a + c >= b + c$
    + 当且仅当 $"succ" a <= b$ 时，有 $a < b$
    + 当且仅当 $exists thin d in ZZ^+， b + d = a$，有 $a > b$
  ]
]

#pos([序的三歧性])[
  $forall thin a， b in NN$，命题 $a > b， a < b， a = b$ 必只有一个成立。
]

#pos([强归纳法原理])[
  $forall thin m_0， x in NN$，$P(x)$ 表示与自然数 $x$ 有关的性质 $P$，$forall m in NN， m >= m_0$，若 
  $forall m' in NN， m_0 <= m' < m，P(m') "为真，则 " P(m) "为真。"$ 当 $m = m_0$ 时，假设中的 $m'$ 
  的取值范围为空，所以假设依然成立，即 $P(m_0)$ 总是为真的。
]

== 乘法 

#def([自然数乘法])[
  $forall thin， n， m in NN$，首先当 $n = 0$ 时，有 $0 times m := 0$，现在归纳性的假设已经定义了
  $n times m$，我们有 $("succ" n) times m = (n times m) + m$ 。
]

乘法具有交换律，且乘法的运算优先级要大于加法，通常省略 times 符号如 $a b + c = (a times b) + c$ 。

#lem([交换律])[
  $forall thin n， m in NN， n times m = m times n$
]

#lem([正整数没有零因子])[
  $forall thin n， m in NN$，若有 $n  m = 0$，当且仅当 $n， m$ 中至少有一个为 $0$，特别的，正整数乘法的结果为正整数。
]

#lem([交换律])[
  $forall thin a， b， c in NN， a(b + c) = a b + a c， (b + c)a = b a + c a$
]
#lem([结合律])[
  $forall thin a， b， c in NN， (a times b) times c = a times (b times c)$
]
// 在证明交换律时，固定两个自然数对另一个自然数进行归纳法即可证明。

#lem([序不变性])[
  $forall thin a， b in NN， c in ZZ^+$，若 $a < b$，则有 $a c < b c$ 。
]

#lem([消去律])[
  $forall thin a， b in NN， c in ZZ^+$，若有 $a c = b c$，则 $a = b$ 。
]
在证明消去律时，可以用到序的三歧性。

#pos([欧几里得算法])[
  $forall thin n in NN， q in ZZ^+， exists thin m， r in NN， 0 <= r < q， n = m q + r$ 。
]

其中 $r$ 为余数，这个算法标志着数论的开始。

#def([指数运算])[
  $forall thin n， m in NN$，当 $n = 0$ 时，$m^0 := 1$，特别的 $0^0 = 1$，现在归纳性的假设已经定义了
  $m^n$ 我们有 $m^(n + 1) = m^n times m$ 。
]

= 集合论

== 基础知识

#def([集合的定义])[
  集合是一堆没有顺序的对象，若有集合 $A$ 且 $x$ 是集合 $A$ 的这些对象当中的一个，我们称 $x$ 属于这个集合，计作 $x in A$ 。
]

#axm([集合也是对象])[
  若 $A$ 是一个集合，那么 $A$ 也是一个对象。
]

这条公理指出一个集合可以作为一个元素，或者说对象而被另一个集合包含。

在纯粹集合论当中，任何对象都是集合，例如在自然数的表示当中，用 $diameter$ 表示 $0$，用 
${diameter}$，表示 $1$，用 ${diameter， {diameter}}$ 表示 $2$，也就是每个自然数都是集合，由其前面的所有自然数所表示的集合组成。 在非纯粹集合论中，有些对象可以不是集合，在一般数学研究下，两者是近乎等价的。

#def([集合的相等])[
  若有集合 $A， B$，当且仅当所有 $x in A， y in B$，满足 $x in B， y in A$ 时，我们称 $A = B$ 。
]

集合的相等关系可以很容易证明出是自反的，对称的，传递的，且因为相等的概念是通过 $in$ 运算来描述的，也自然继承
$in$ 运算的替换公理，所有只由 $in$ 运算构成的新运算都遵循替换公理。

#axm([空集])[
  存在一个不包含任何对象的集合：空集 $diameter$ 或 ${}$，表示对于任意的对象 $x$，均有 $x in.not diameter$ 。
]
我们可以用单个选取引理来证明集合的非空性，即若有一非空集合 $A$，则存在 $x in A$ 。

#axm([单元素集合与双元素集合])[
  单元素集合即一个只存在一个对象的集合 ${a}$，当且仅当 $x = a$ 时，有 $x in {a}$，双元素集合为之存在两个对象的集合
  ${a， b}$，当且仅当 $y = a$ 或 $y = b$ 时，有 $y in {a， b}$ 。
]

#axm([两个集合的并集])[
  有集合 $A， B$，若有一个集合包含了所有属于集合 $A$ ，或属于集合 $B$ 或同时属于集合 
  $A， B$ 的对象，我们称这个集合为集合 $A， B$ 的并集 $A union B$ 。即，对于任意的对象 $x$ 有
  $ x in A union B <==> x in A "或 " x in B $
]

#lem[
  集合的并集符合交换律和结合律。
]

#def([子集])[
  有集合 $A，B$，若对于 $A$ 中的任意对象 $x$，有 $x in B$，则称集合 $A subset.eq B$，即集合
  $A$ 是集合 $B$ 的子集。当 $A != B$ 时，称 $A subset.neq B$ 即集合 $A$ 是集合 $B$ 的真子集。  
]

定义子集的同时也定义了集合间的包含关系，其使得集合是偏序的而非全序的。即两个集合之间存在除了子集，真子集，相等集合外的彼此不为对方子集的关系。

#axm([分类公理])[
  又称为分离公理，对于集合 $A$ 中某一对象 $X$ 的某一性质 $P(x)$，其要么为真要么为假，由分类公理构成的集合为
  ${x in A : P(x)}$ 表示集合 $A$ 中那些对于 $P(x)$ 为真的对象所构成的新集合。即
  $ y in {x in A : P(X)} <==> y in A "并且 " P(y) "为真" $
]

#def([集合的交集])[
  有集合 $A， B$ 根据分类公理，我们定义集合的交集为
  $ A sect B := {y in A : y in B} $
]

#def([集合的差集])[
  有集合 $A， B$ 根据分类公理，我们定义集合的交集为
  $ A without B := {x in A， x in.not B} $  
]

通过差集，交集，并集的运算，集合可以构成布尔代数
#pos([集合构成布尔代数])[
  #align_enums[
    #set enum(numbering: "(a)",number-align: start + bottom)
    + 最小元
    + 最大元
    + 恒等式
    + 交换律
    + 结合律
    + 分配律
    + 分拆法
    + 德摩根律
  ]
]

#axm([替换公理])[
  对一集合 $A$ 上的元素 $x$，有命题 $P(x， y)$，当对于任意的 $x$ 都存在最多一个 $y$ 满足 $P(x， y)$ 时称命题为真，那么存在一个集合
  ${y : P(x， y) "对于任" x in A "为真"}$ 使得对任意的对象 $z$ 有 
  $ z in {y : P(x， y) "对于任" x in A "为真"} <==> "对于" x in A，P(x，z) "为真" $
]
替换公理的另一种形式是 ${y : x in A， y = f(x)}$，我们可以将其表示为 ${f(x) | x in A}$ 。
#axm([无穷大])[
  对于一个集合 $NN$，$0$ 在集合中，以及对于所有 $x in NN$，其满足皮亚诺公理的后继也在集合 
  $NN$ 中，这个集合是个无穷大的集合。
]

== 罗素悖论

#axiom([万有分类])[
  有一性质 $P$ 对于任意对象 $x$ 有 $P(x)$，可以构造出所有只含有 $P(x)$ 为真的对象 $x$，即 
  $ y in {x : P(x) "为真"} <==> P(y) "为真" $
]

万有分类 (universal specification) 公理希望对于某一个性质，可以构造出一个含有符合这个性质的所有对象的集合，若这条公理成立，在处理问题时，大概可以只考虑某一性质 $P$ 然后通过这条公理（也称为概括公理或万有公理）来构造出一个所有符合该性质的全部，也就是没有缺口的集合，并用集合操作来进行数学研究等等。但是这条公理并不能进入公理化集合论，罗素指出了万有公理是悖论性的。

#def([罗素悖论])[
  对于任意对象 $x$ 有性质$P$： $ P <=> "若" x "是一个集合，有" x in.not x $ 
  通过万有公理构造集合 
  $S := {x : P(x)}$，问 $S$ 是否属于集合 $S$。
  #align_enums[
    + 若 $S in S$，则对于定义来说，$P(S)$ 为假，根据万有公理，$S in.not S$ 。 
    + 若 $S in.not S$，则对于定义来说，$P(S)$ 为真，根据万有公理，$S in S$ 。 
  ]
  也就是不管从那方面进行推断，我们得到的结论都是 $S in S and S in.not S$，这显然是不正确的。
]

这是因为集合也是对象，在构造自身的同时自身也成为了构造自身的一部分，也就是发生了自指。在数学中，对自指的研究最终导致了著名的哥德尔不完备定理。

为了解决罗素悖论，数学家为集合论加上了限制以防止自指对发生。数学家们为集合划分了等级，最原始的等级是那些不能用集合表达的原始对象，如自然数 $1$ 等，次之是只包含原始对象的原始集合以及空集，如 ${1, 2}，diameter$，接着是可以包含原始对象，也可以包含原始集合的集合，以此类推，也就是一个层级的集合只能包含低于其层级的对象。

陶哲轩没有给出复杂的严格形式化表达，而是给出了一条正则性公理：

#axm([正则性])[
  对于任意一个集合 $S$，至少有一个对象 $x in S$，并且 $x$ 不是一个集合，或者当 $x$ 是一个集合时有 $x sect S = diameter$ 。
]


== 函数

#def([函数])[
 对于一个集合 $X，Y$ 存在映射关系 $f$，对于任意 $x in X$，恰只有一个 $f(x) in Y$，则称 
 $f : X -> Y$ 为定义域 $X$ 到陪域 $Y$ 上的一个函数，或映射、变换。
]

函数有定义域 domain，陪域 codomain 和值域 range，其中值域是对于所有 
$x in "domain"$ 可以取到的所有 $f(x)$ 所构成的集合，其中
$"range" subset.eq "codomain"$ 。

#def([函数的相等性])[
  有函数 $f，g$ 若它们有相同的定义域和值域 $X，Y$ 且对于任意 $x in X$，有 $f(x) = g(x)$，则称 $f = g$ 。
]

函数有三种特殊类型：单射 injective，满射 surjective，双射 bijective。

#def([单射函数])[
  有函数 $f : X -> Y$，$forall thin x， x' in X$，有 $x != x' ==> f(x) != f(x')$ 。
]

#def([满射函数])[
  有函数 $f : X -> Y$，对于每一个 $y in Y$，存在 $x in X，f(x) = y$ 。 满射函数的陪域等于其值域。
]

#def([双射])[
  即是单射又是满射的函数为双射函数，双射函数又称为可逆函数。
]

若函数 $f : X -> Y$ 是双射，那么对于任意 $y in Y$，恰好存在一个 $x in X$ 使得 $f(x) = y$。此时 $x = f^(-1)(y)$，我们称 $f^(-1) $ 为 $ f$ 的逆。

#def([函数的复合])[
  有函数 $f : X -> Y，g : Y -> Z$，这时函数 $f$ 的值域与 $g$ 的定义域相同，我们称 $g compose f : X -> Z$ 为两个函数的复合函数，有 $
    (g compose f)(x) := g(f(x))
  $
]

#def([复合是可结合的])[
  有三个函数 $f : Z -> W，g : Y -> Z，h : X -> Y$，则有 $f compose (g compose h) = (f compose g) compose h$ 。
]

\

== 象和逆象

#def([函数的象])[
  有函数 $f : X -> Y$，有 $S subset.eq X$，我们称 $
    f(S) := {f(x) | x in S}
  $
  为集合 $S$ 在函数 $f$ 上的象，或前象（与后文逆象相对）。
]

#def([函数的逆象])[
  有函数 $f : X -> Y$，有 $S subset.eq Y$，我们称 $
    f^(-1) (S) := {x | x in X，f(x) in S }
  $
  为集合 $S$ 在函数 $f$ 上的逆象。
]

=== 幂集公理
#axm([幂集公理])[
  有集合 $X，Y$，我们称集合 $X^Y$ 为含有定义域为 $X$ 值域为 $Y$ 的所有函数的集合，即 $
    forall f in X^Y <==> f : X -> ("range" : Y)
  $
]

#lem[
  若 $X$ 是一个集合，则有 ${Y | Y subset.eq X}$ 是一个集合。
]

#axm([并集公理])[
  若集合 $S$ 其中的所有元素也都是集合，则有集合 $union S$，它是集合 $S$ 中所有集合的并集，即 $
    forall x in union S := exists thin A in S， x in A
  $
]

在公理之前，我们并不能方便的表达“集合中所有元素的并集”这句话，因此我们引入指标集 $I$，其中标签 
$alpha in I$，而所有的 $A_alpha$ 被称为一个集族。那么我们定义集族的交集为： $
  union.big_(alpha in I) A_alpha := union {A_alpha | a in I}
$

类似的，集族的并集为：$
  sect.big_(alpha in I) A_alpha := {x | forall a in I，x in A_alpha}
$

集合论章节介绍的公理 Axiom 2.1 - Axiom 2.10 不包括万有分类公理 Axiom 2.8 被称为 Zermelo - Fraenkel 集合论公理（ZF）。

== 笛卡尔积

#def([有序对])[
  对于任意的对象 $a， b$，有序对是形如 $(a，b)$ 的对象，其中对象 $a，b$ 的顺序是有意义的，即 
  $(a，b)$ 和 $(b，a)$ 是不同的对象。
]

#def([笛卡尔积])[
  有集合 $X，Y$，定义 $X times Y = {(a，b) | a in X，b in Y}$ 。
]

#def([$n$ 维有序对与 $n$ 重笛卡尔积])[
  有 $n$ 个集合 $S_1,S_2,...,S_n$ 则它们的笛卡尔积为 
  $ product_(i = 1)^n S_i = {(x_1, x_2, ..., x_n) | "对于任意的"  1 <= i <= n, x_i in S_i} $
  其中形如 $(x_1, x_2, ..., x_n)$ 的有序对为 $n$ 维有序对。
]

特殊的，空笛卡尔积 $product_(1 <= i <= 0)$ 为集合 ${()}$ 。

#lem([有限选取])[
  有 $n$ 个集合 $S_1, S_2, ... , S_n$ 都是非空集合，则其 $n$ 重笛卡尔积 $product_(i = 1)^n S_i$ 也为非空集合。
]

== 集合的基数

集合是顺序无关的，但在有限集内，集合中对象的数量是固定的，可数的，而目前为止只介绍了自然数集 
$NN$，本章主要内容为阐明只要集合是有限的，就可以用自然数作为集合的计数集合这一命题。

#def([相等的基数])[
  有集合 $S_1， S_2$，当且仅当两集合之间存在一个双射 $f : S_1 -> S_2$，称两个集合有相同的基数。
]

相等的基数也是一种等价关系，若有三个集合 $X，Y，Z$ 其中两两具有相同的基数，那么它们三个有相同的基数，通过函数复合的结合律即可以证明这一点。

#def([自然数作为计数集合])[
  有自然数 $n$，当且仅当集合 ${i | i in NN， 1 <= i <= n  }$ 与集合 $S$ 有相等的基数时，称集合 
  $S$ 的基数为 $n$，即集合 $S$ 中有 $n$ 个元素。
]

#pos([集合基数的唯一性])[
  一个集合有且只有一个基数。
]

#def([有限集])[
  当一个集合的基数是一个自然数时，称这个集合是有限集，否则这个集合为无限集。用 $\#(S) = n$ 来表示这个集合的基数。
]

#tem()[
  自然数集 $NN$ 是一个无限集。
]

集合之间存在基数算数。

// = 整数和有理数
