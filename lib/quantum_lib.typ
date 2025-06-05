#import "math_lib.typ": otimes

// Reduced Planck constant
#let hbar = $planck.reduce$

// Space between > and < in |a><b|
// This should be used in a few places
// I want this to be private. Can't do that. So, use an underscore.
// But, must use: #_ketbraspc in math mode
#let _ketbraspc = h(-0.20em)

/////////////////////
// Dirac bra-ket notation
/////////////////////

// You can write any expression using just ket(x) and bra(x), but
// the result has more space than I prefer.
// I prefer less space between elments of bra-ket notation.
// The result is many functions for various combinations.
// For example, the most elaborate is `ketbraketbra(w,x,y,z)` for |w><x|y><z|
//
// With this spacing, the (apparent) ambiguity of expressions is preserved.
// They look more like you might write them.

// |x>
#let ket(x) = math.class("normal", {$|#x angle.r$})

// <x|
#let bra(x) = math.class("normal", {$angle.l #x|$})

// <x|y>
#let braket(x, y) = math.class("normal", {$angle.l #x|#y angle.r$})

// <x, y>, Standard notation, not bra-ket
#let inner(x, y) =  {$angle.l #x, #y angle.r$}

// |x><y|
// Or |x><x| if one arg is passed.
// Note: math.class("normal",...) suppresses spacing around the ketbra
#let ketbra(x, ..other) = math.class("normal", {
    let y = other.at(0, default: x)
    $ket(#x) #_ketbraspc bra(#y)$
//    {$|#x angle.r #_ketbraspc angle.l #y|$}
})

// |x><y|z>
#let ketbraket(x, y, z) = {
    $ket(#x) #_ketbraspc braket(#y, #z)$
//    {$|#x angle.r #_ketbraspc angle.l #y|#z angle.r $}
}

// |w><x|y><z|
#let ketbraketbra(w,x,y,z) = {
    $ket(#w) #_ketbraspc braket(#x,#y) #_ketbraspc bra(#z)$
//    $|#w angle.r #_ketbraspc angle.l #x|#y angle.r #_ketbraspc angle.l #z|$
}

// This is now obsolete, because I wrapped ket in math.class(...
// Multiply ket by scalar or operator
// By default, too much space is inserted between the element before a ket
// So you should make the following replacement in your document:
// A |b> --> mulket(A, b)
// #let mulket(a, b) = {$#a #h(.05em) ket(#b)$}

// <x|y><z|
#let braketbra(x, y, z) = {
    $braket(#x,#y) #_ketbraspc bra(#z)$
}

// |<x|y>|^2
#let absbraket(x, y) = $|braket(#x, #y)|^2$

// Dirac bracket expectation
// <x|A|x>
#let expect(state, obs) = {$angle.l #state|#obs|#state angle.r$}

// This is occasionally colloquially called a "sandwich"
// It is a matrix element only if a and b are orthonormal.
// <a|M|b>
#let sandwich(a, M, b) = {$angle.l #a|#M|#b angle.r$}

// The shorter, more symbolic expression for Slater determinant
#let slatershort(sphi, N) = {
    $|#(sphi)_1 #(sphi)_2 dots.c #(sphi)_#N|$
}

// Slater determinant as matrix with vertical bars for delimiter
#let slater(sphi, x, N) = {
$
    1/sqrt(#N!) mat(row-gap: #(6pt), column-gap: #(4pt), delim: "|",
    #(sphi)_1 (#(x)_1), #(sphi)_2 (#(x)_1), ..., #(sphi)_#N (#(x)_1);
    #(sphi)_1 (#(x)_2), #(sphi)_2 (#(x)_2), ..., #(sphi)_#N (#(x)_2);
    dots.v, dots.v, dots.down, dots.v;
    #(sphi)_1 (#(x)_#N), #(sphi)_2 (#(x)_#N), ..., #(sphi)_#N (#(x)_#N);
    )
$
}

#let vacstate = $ket("vac" #h(0em))$
//#let vacstate = $ket(emptyset)$

// RZ rotation
#let RZ = math.op("RZ")
#let CNOT = math.op("CNOT")
#let X = math.op("X")

// Measurement operator
// Eg. Meas_Z
#let Meas = math.op("M")

#let CNOTop = $ketbra(0) otimes id + ketbra(1) otimes X$
