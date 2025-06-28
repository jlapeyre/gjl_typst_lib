////////////////////////////////
// Numbers
////////////////////////////////

// The set of real numbers
#let Rr = $RR$
// The non-negative reals
#let Rrnonneg = $Rr_(>= 0)$
// The set of integers
#let Zz = $ZZ$
// The set of complex numbers
#let Cc = $CC$
// The set of rational numbers
#let Qq = $QQ$
// The counting numbers
#let Nnp = $NN_plus$
#let sgn = math.op("sgn")
// Override definition of Re for real part
// It is Fraktur or s.t. by default
#let Re = math.op("Re")
// and imaginary part
#let Im = math.op("Im")
// complex conjugate
#let conj(z) = $#z^*$

#let notation_numbers = (
    ($Rr$, [The set of real numbers]),
    ($Rrnonneg$, [The set of non-negative real numbers.#label("notation-nonneg-reals")]),
    ($Zz$, [The set of integers]),
    ($Cc$, [The set of complex numbers]),
    ($conj(z)$, [The complex conjugate of $z in Cc$]),
    ($Re(z)$, [The real part of $z in Cc$]),
    ($Im(z)$, [The imaginary part of $z in Cc$]),
)

// Matrices

// The set of complex matrices
#let Ccmat(..dims) = {
    let nargs = dims.pos().len()
    if nargs == 1 {
        let n = dims.at(0)
        $Cc^(n times n)$
    } else if nargs == 2 {
        let n = dims.at(0)
        let m = dims.at(1)
        $Cc^(n times m)$
    } else {
        panic("Ccmat takes requires exactly one or two arguments.")
    }
}

// Matrix representation of linear operator
#let Mat(..args) = {
    let nargs = args.pos().len()
    if nargs == 1 {
        let operator = args.at(0)
        $[#operator]$
    } else if nargs == 2 {
        let operator = args.at(0)
        let basis = args.at(1)
        $[#operator]_basis$
    } else {
        panic("Mat takes exactly one or two arguments")
    }
}

////////////////////////////////
// Algebra and functions
////////////////////////////////

// Operator identity
// This overwrites existing definition
// Make it bb bold.
#let id = $II$

// kernel or null space of operator
// We previously "null" instead of "ker"
#let ker = math.op("ker")

// Range of operator
#let range = math.op("range")

// Nullity: dimension of null space
#let nullity = math.op("nullity")
#let rank = math.op("rank")
#let span = math.op("span")

#let diag = math.op("diag")

// cal(L)(V) is the set of linear operators on space V
#let opspc = $cal(L)$

//
// Groups
//

// Wrap argument in angle brackets. Used for generating set of a group.
#let anglebracket(x) = {$angle.l #x angle.r$}
#let cyclic(n) = $C_#n$ // cyclic group
#let dihedral(n) = $D_#n$ // dihedral group

// Uh-oh, we have labels mixed in here. Hmmm
#let notation_linear_algebra = (
    ($id$, [The identity operator]),
    ([$A^dagger$], [The Hermitian adjoint of operator or matrix $A$. @def-adjoint]),
    ([$opspc(V, W)$],  [The set of linear transformations from $V arrow.r W$.]),
    ([$opspc(V)$], [The set of linear operators on the vector space $V$.]),
    ($Ccmat(n,m)$, [The set of $n times m$-dimensional complex matrices]),
    ([$Mat(T)$], [A matrix representation of linear operator $T$]),
    ([$Mat(T, cal(B))$], [The matrix representation of linear operator $T$ in ordered basis $cal(B)$.])
)

#let Tr = math.op("Tr")

// Other, for the moment

#let otimes = {$times.circle$}

///
/// Logic
///

#let implies = $arrow.r.double.long$
#let impliesiff = $arrow.r.l.double.long$

#let notation_other = (
    ($otimes$, [tensor product, or outer product]),
    ($implies$, ["implies", logical implication]),
    ($cyclic$, [cyclic group]),
    ($plus.circle$, [The direct sum of vector spaces. @def-direct-sum]),
)

///
/// Proofs
///

// Print a qed symbol (a square) at the far right of the line
#let qed = [#h(1fr) $square$]

///
/// Analysis (I think)
///

// There is a bigger, fancier, package for this as well.
// Partial derivative
#let pdiff(y, x) = $(partial #y) / (partial #x)$
// Nth partial derivative. (There are libraries for fancier things)
#let pdiffn(y, x, n) = $(partial^#n #y) / (partial #x^#n)$

////////////////////////////////
// Probability and Statistics
////////////////////////////////

// Expected value
#let expt(x) = {$EE[#x]$} // bboard bold

// Variance
#let var(y) = {$#math.op("Var") [#y]$} // bboard bold

#let notation_probability = (
    ($expt(x)$, [Expected value of $x$]),
    ($var(x)$, [Variance of $x$]),
)

////////////////////////////////
// Miscellaneous
////////////////////////////////

#let cancelto(body, to) = {
  let arrow = rotate(-55deg, scale(x: 170%, $-->$))
  context {
    let m = measure(body)
    let (w, h) = (m.width, m.height * 2)
    set place(center + horizon)
    // block(height: h * 2.5, align(horizon, body)) // Add vertical margins.
    body
    // place(dx: -w * 0.5, dy: -h * 0.1, arrow)
    // place(dx: w * 0.3, dy: -h * 1.1, $0$)
      place(dx: -w * 0.5, dy: -h * (0.1), arrow)
      place(dx: w * 0.0, dy: -h * 1.0, $0$)
  }
}

