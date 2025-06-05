#import "@preview/quill:0.7.0": *

#import "quantum_lib.typ": Meas

// Example: This,
// #quantum-circuit( scale: 130%,
//     measure(target: 1), [\ ],
//     $X$
// )
//
// Draws something like this:
// Except the right side of the upper box is curved.
//
//          ┌─────┐
// q0: ─────│ M_Z │─────
//          │     │
//          └──┬──┘
//             ║
//             ║
//             ║
//            ┌┴┐
// q1: ───────│X│────────
//            └─┘

// - name : is drawn in the measurement box
// - target : a double wire is drawn vertically to connect to the target wire.
#let measure(name: $Meas_Z$, target: none) = {
    gate(name, radius: (right: 100%),
        multi: (target: target, num-qubits: 1, wire-count: 2, wire-label: ""))
}
