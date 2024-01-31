#import "./../setup/templates.typ": *
#import "./../setup/theorem.typ": *
#show: thmrules

// #show math.equation: set text(font: "New Computer Modern Math")
// #show math.equation: set text(font: "Libertinus Math")

#show: project.with(
  title: "Linear Algebra", authors: ("epoche",), language: "ch", outl: [
    #outline(indent: true, title: "目录", depth: 2)
  ],
)

#show math.ast: math.thin
#let obey = math.tilde
#let vb = $bold(beta)$
#let va = $bold(alpha)$
#let ve = $bold(e)$

= Vector
== How to prove Two-vector collinear theorem

#definition("scalar multiplication of vectors")[

  A real number $lambda$ times a vector $bold(a)$ is equal to a vector $lambda bold(a)$:
    - In the direction: when $lambda > 0$, they are in the same direction, when $lambda = 0, lambda bold(a) = bold(0)$, when $lambda < 0$, they are in the opposite direction. 
    - $abs(lambda bold(a)) = abs(lambda) abs(bold(a))$
]

#theorem("Two-vector collinear theorem")[

  There are two non-zero vector $bold(a), bold(b)$. If it exists a real number $lambda$, such that: 
  $ bold(a) parallel bold(b) <==> bold(b) = lambda bold(a) $
]

/*
#proof()[
  Set vectors $bold(a), bold(b)$, since $bold(a) parallel bold(b)$, exists a real number $lambda$ $
    abs(lambda) = abs(bold(b)) / abs(bold(a))
  $
  
  Since Definition 1.1 $
    bold(b) = lambda bold(a)
  $
  
  Reversely, if 
  $ lambda bold(a) = bold(b) $
  Then 
  $ bold(a) parallel bold(b) $
]
*/

=== Three-point collinear decision theorem
#theorem("Three-point collinear decision theorem")[        

If $A, B, C$ are collinear, then:
  $ accent(O B, ->) = lambda accent(O A, ->) + (1 - lambda) accent(O C, ->) $
]
// *Proof*
#proof()[
  Since $A, B, C$ are collinear, we have $
  accent(C\B, ->) parallel accent(A\C, ->) \
  accent(C B, ->) = lambda accent(A C, ->) 
  $

  So  $
  accent(O B, ->) - accent(O C, ->) = lambda (accent(O A, ->) - accent(O C, ->)) \ 
  $

  Hence $
  accent(O B, ->) = lambda accent(O A, ->) + (1 - lambda) accent(O C, ->)
  $
]

=== Expand to triangle

#theorem("Three-point collinear decision theorem in triangle")[

  In $triangle_(A B C)$, $D$ is the $n$ equal component of $B\C : n B\D = k D\C = B\C$. \
  $ accent(A\D, ->) = n/(n + k) accent(A\B, ->) + k/(n + k) accent(A\C, ->) $
]

#proof()[
  We have $
  accent(A\B, ->) + accent(B\D, ->) = accent(A\D, ->) \
  accent(A\D, ->) + accent(D\C, ->) = accent(A\C, ->) \
  $ 

  Since $n B\D = k D\C = B\C$, We can have $
  accent(B\C, ->) = n accent(A\D, ->) - n accent(A\B, ->) \
  accent(B\C, ->) = k accent(A\C, ->) - k accent(A\D, ->) \
  $

  So $
  k accent(A\C, ->) - k accent(A\D, ->) = n accent(A\D, ->) - n accent(A\B, ->) $

  Hence $
  accent(A\D, ->) = n/(n + k) accent(A\B, ->) + k/(n + k) accent(A\C, ->)
  $
]

== In three dimensions space

#lemma("Fundamental theorem of space vectors")[
  
  In three dimensions, we have three noncoplanar vectors $bold(e_1), bold(e_2), bold(e_3)$, for arbitrary vector $bold(P)$,  exist a unique tuple $(x, y, z)$, hence:
  $ bold(P) = x bold(e_1) + y bold(e_2) + z bold(e_3) $ 
]

Hence, we can define:
#definition()[

  Let the three cross-perpendicular vector $bold(e_1), bold(e_2), bold(e_3)$ as orthogonal bases in three dimensions space, and let $(x, y, z)$ represent vector's coordinates. 
]

#theorem("Fundamental theorem of cooriented quantities")[

  If threr are two non-collinear vector $bold(x), bold(y)$, the sufficient and necessary condition that vector $bold(P)$ is coplanar with $bold(x), bold(y)$ is exists the unique real pair $(lambda, mu)$ such that:
  $ bold(P) = lambda bold(x) + mu bold(y) $
]

== Expand

=== Rotation of vector

#theorem()[

  In two-dimensions space, set the angle of vector $bold(a)$ is $theta$, the cordinate of $bold(a)$ is $(x, y)$, the length of $bold(a)$ is $l = sqrt(x^2 + y^2)$, then the cordinate of $bold(a)$ can be represent as $(l cos theta, l sin theta)$, set a vector $bold(b)$ have angle $alpha$ respect to $bold(a)$, such that: $
    bold(b) = (x cos alpha - y sin alpha, y cos alpha + x sin alpha)
  $
]

#proof()[
  We have angle $alpha$ respect to $bold(a)$, so that $
    bold(b) = (l cos (theta + alpha), l sin (theta + alpha))
  $
  According to Triangle identity transformation $
    bold(b) = (l cos theta cos alpha - l sin theta sin alpha, l sin theta cos alpha + l cos theta sin alpha)
  $
  According to $bold(a) = (l cos theta, l sin theta)$, hence $
    bold(b) = (x cos alpha - y sin alpha, y cos alpha + x sin alpha)
  $
]

== Inner product
#definition()[
* Inner product *
  $ va dot vb = abs(va) abs(vb) cos accent( \( va \,  vb\), hat ) $
]

#lemma()[ 
* Cordinate representation *
  $ va dot vb = x_1 x_2 + y_1 y_2 + z_1 z_2 $
]

#proof()[
  Set orthogonal bases $bold(i), bold(j), bold(k)$, we can have $
    bold(i)^2 = bold(j)^2 = bold(k)^2 = 1 \
    bold(i) dot bold(j) = bold(j) dot bold(k) = bold(i) dot bold(k) = 0 
  $
  Let $va = (x_1, y_1, z_1), vb = (x_2, y_2, z_2)$ since $
    va dot vb = (x_1 bold(i) + y_1 bold(j) + z_1 bold(k)) dot (x_2 bold(i) + y_2 bold(j) + z_2 bold(k))
  $
  Simplify it $
    va dot vb = 
    (x_1 x_2) space bold(i)^2 + (x_1 y_2) space bold(i) dot bold(j) + (x_1 z_2) space bold(i) dot bold(k) \
    + space (y_1 y_2) space bold(j)^2 + (y_1 x_2) space bold(j) dot bold(i) + (y_1 z_2) space bold(j) dot bold(k) \
    + space (z_1 z_2) bold(k)^2 + (z_1 x_2) space bold(k) dot bold(i) +(z_1 y_2) space bold(k) dot bold(j) \
    = x_1 x_2 + y_1 y_2 + z_1 z_2
  $
  Hence $
    va dot vb = x_1 x_2 + y_1 y_2 + z_1 z_2
  $
]

== Outer product
#definition()[
* Outer product * 

  $va times vb$ is a vector. \
  $va times vb, va, vb$ allows right hand rule.
  $ 
      abs(va times vb) = abs(va) abs(vb) sin accent( paren.l va comma  vb paren.r, hat ) \
      va times vb bot va bot vb \
  $
]

#lemma()[ 
* Reverse-exchange law *
  $
    va times vb = - vb times va
  $
]

* Outer product matrix representation in three dimensions*
  $ 
        va times vb = mat(delim: "|" , bold(i), bold(j), bold(k) ; x_1, y_1, z_1; x_2, y_2, z_2) = mat(delim: "|", y_1, z_1; y_2, z_2) bold(i) - mat(delim: "|", x_1, z_1; x_2, z_2) bold(j) + mat(delim: "|", x_1, y_1; x_2, y_2) bold(k)
  $


  
= Matrix

Normally, $bold(I)$ represent the unit matrix: main diagonal all equal to $1$, rest all equal to $0$.

#definition()[

  Set the number of rows of a matrix $X$ is $r_X$, column of it is $c_X$, $X$ is arbitrary.
  
    * Homomorphic matrix : * 
  There are two matrix $A, B$, $r_A = r_B and c_A = c_B$.
  
    * Square : * 
  There is a matrix $A$, $r_A = c_A$. 
  
    * Main diagonal : *
  There is a square A have $n$ factorial, the set of the main diagonal element is $ {A_(i j) | i = j in [1, n]} $
  
    * symmetric matrix : * 
  There is a square matrix of n factorials $A : A_(i j) = A_(j i) space (i in [1, n], j in [1, n])$.
  
    * Diagonal matrix : *
  A matrix have nonzero element only on the main diagonal, with the rest of the elements are being $0$, It can represented as $ op("diag") {lambda_1, dots.h.c , lambda_n} space (lambda_n = A_(n n)) $
  
    * Triangle matrix : *
]

