#import "./../setup/templates.typ": *
#import "./../setup/theorem.typ": *
#show: thmrules

// #show math.equation: set text(font: "New Computer Modern Math")
// #show math.equation: set text(font: "Libertinus Math")

#show math.ast: math.thin
#let obey = math.tilde

#show: project.with(
  title: "Note on Calculus",
  authors: (
    "epoche",
  ),
  language: "ch",
)

//#show math.equation: set text(font: "New Computer Modern Math")
//#show math.equation: set text(font: "Libertinus Math")

// = 不定积分

// = 微分方程

// = 多元函数的微分学

= 重积分

== 二重积分

#definition()[
$ limits(integral.double)_D f(x, y) dif sigma = lim_(lambda -> 0) sum_(i = 1)^n f(xi_i, eta_i) sigma_i $
]

=== 直角坐标系

$ dif sigma = dif x dif y $

#formula()[
 先横切再竖切  $
  D := lr({ (x, y) | y in [c, d], x in [phi_1(y), phi_2(y)] }) \
  limits(integral.double)_D f(x, y) dif x dif y 
  = 
  integral_c^d  [integral_(phi_1(y))^(phi_2(y)) f(x, y) dif x] dif y \
  $
  Also represented as $
  integral_(c)^(d) dif y integral_(phi_1(y))^(phi_1(y)) f(x, y) dif x 
  $
]

#formula()[
 先竖切再横切  $
  D := lr({ (x, y) | x in [a, b], y in [phi_1(x), phi_2(x)] }) \
  limits(integral.double)_D f(x, y)  dif x dif y 
  = 
  integral_(a)^(b) dif x integral_(phi_1(x))^(phi_1(x)) f(x, y) dif y
$
]

=== 极坐标系

#formula()[
$ limits(integral.double)_D f(rho cos theta , rho sin theta) rho dif rho dif theta 
=

integral_alpha^beta dif theta integral_(phi_1(theta))^(phi_2(theta)) f(rho cos theta, rho sin theta) rho dif rho
$
]
== 三重积分

#definition()[
   三重积分  \ $
    limits(integral.triple)_Omega f(x, y, z) dif v 
    = 
    lim_(lambda -> 0) sum_(i = 1)^n f(xi_i,  eta_i, zeta_i) Delta v_i   
  $
]

=== 直角坐标系

$
  limits(integral.triple)_Omega f(x, y, z) dif v
  = 
  limits(integral.triple)_Omega f(x, y, z) dif x dif y dif z
$

#formula()[
   投影穿线法 ： （先对 $z$ 积分， 再对 $x, y$ 做二重积分的处理）
  
  将 封闭区域 $Omega$ 投影至 $x O y$ 面上得到封闭面 $D_(x y)$，因此： $
    Omega := {(x, y, z) | z_1(x, y) <= z <= z_2(x, y), (x, y) in D_(x y)} \
    D_(x y) := {(x, y) | y_1(x) <= y <= y_2(x), a <= x <= b} \
  $
  则 $
    limits(integral.triple)_Omega f(x, y, z) dif v
    =
    integral_a^b dif x integral_(y_1(x))^(y_2(x)) dif y integral_(z_1(x, y))^(z_2(x, y)) f(x, y, z) dif z
  $
]

#formula()[
   投影切面法 ：  

  记 $l$ 为 $Omega$ 在 $z$ 轴上的投影， $D_z$ 为 $Omega$ 在 $z = z$ 的截面： $
    Omega := {(x, y, z) | x, y in D_z, a <= z <= b} \
    limits(integral.triple)_Omega f(x, y, z) dif v = integral_a^b dif z limits(integral.double)_D_x f(x, y, z) dif x dif y
  $
]

=== 柱坐标系

圆柱，圆锥，旋转体
#formula()[ 
    $
    limits(integral.triple)_Omega f(rho cos theta, rho sin theta, z) rho * dif rho * dif theta * dif z
    = integral_alpha^beta dif theta integral_(phi_1(theta))^(phi_2(theta)) rho dif rho integral_(z_1)^(z_2) f(x, y, z) dif z
    $  
]

=== 球坐标系

积分区域与球有关

#definition()[
  
  在球面坐标系中，球半径设为 $r$，$r$ 与 $z$ 轴的夹角设为 $phi$，$r$ 在 $x o y$ 面上的投影距离 $x$ 轴的夹角设为 $theta$，有：
  $
  cases(
    z = r cos phi,
    x = r sin phi cos theta,
    y = r sin phi sin theta
  )
  $
  体积元 $dif x dif y dif z = r^2 sin phi dif r dif phi dif theta$
]

#formula()[ 
    $
    I &=  limits(integral.triple)_Omega f(r sin phi cos theta, r sin phi sin theta, r cos phi) * r^2 * sin phi *  dif r * dif phi * dif theta \
    &= integral_(theta_1)^(theta_2) dif theta integral_(phi_1)^(phi_2) dif phi integral_(r_1)^(r_2) F(r, phi, theta) * r^2 * sin phi * dif r
    $  
]

= 曲线积分和曲面积分

== 曲线积分
=== 对弧长的曲线积分

#definition()[ $ 
  integral_L f(x, y) dif s = lim_(lambda -> 0) sum f(xi_i, eta_i) Delta s_i
  $
]


#formula()[

  有参数方程：$ 
    L := cases( x = phi(t), y = psi(t) ) space space space space (alpha <= t <= beta) $
    所以： $
    integral_L f(x, y) dif s = integral_alpha^beta f[phi(t), psi(t)] sqrt(phi'^2(t) + psi'^2(t)) dif t space space (alpha < beta)
   $ 
]

=== 对坐标的曲面积分

#definition()[ 
    $
    integral_L F(x, y) dot dif bold(r)  & = integral_L P(x, y) dif x + Q(x, y) dif y \ 
    & = lim_(lambda -> 0) sum_(i = 1)^n [Q (xi_i, eta_i) Delta y_i + P (xi_i, eta_i) Delta x_i] 
  $ 
  
]

#formula()[
  有参数方程 $
    cases(x = phi(t), y = psi(t)) 
    $
  则 $
  I  = &integral_L P(x, y) dif x + Q(x, y) dif y \ 
    = 
    & integral_alpha^beta {P[phi(t), psi(t)] phi'(t) + Q[phi(t), psi(t)] psi'(t)} dif t
  $
]

=== 格林公式

#formula()[
  $
  integral.cont_L P(x, y) dif x + Q(x, y) dif y = plus.minus limits(integral.double)_D ((diff Q)/(diff x) - (diff P)/(diff y)) dif x dif y
  $
]

== 曲面积分

=== 对面积的曲面积分

#formula()[
  $
    & limits(integral.double)_Sigma f(x, y, z) dif S \
    = &  limits(integral.double)_(D_(x y)) f[x, y, z(x, y)] sqrt(1 + z_(x)^2 + z_(y)^2) dif x dif y
  $
]

=== 对坐标的曲面积分

#formula()[
  $
    & limits(integral.double)_Sigma f(x, y, z) dif x dif y \
    = &  plus.minus limits(integral.double)_(D_(x y)) f[x, y, z(x, y)]  dif x dif y
  $
]

=== 高斯公式

#formula()[
  $
    & limits(integral.surf)_Sigma P dif y dif z + Q dif z dif x + R dif x dif y
    = & limits(integral.triple)_Omega ((diff P)/(diff x) + (diff Q)/(diff y) + (diff R)/(diff z)) dif v
  $
]