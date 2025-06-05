#import "@preview/ctheorems:1.1.3": *

// Following essential for correct numbering!
// #show: thmrules
// Or include some modification

// This does not work when imported. It must be repeated in including file
#show: thmrules.with(qed-symbol: $square$)

//#import "@preview/great-theorems:0.1.1": *
// #import "@preview/rich-counters:0.2.1": *

// Use this to toggle allowing breaking theorem-like environments
// across pages. I tested it and allowing breaking makes
// 71 pages go to 69 pages. So using breakable to save space is
// not worth it, if you think that not breaking is more clear.
#let mybreakable = false

// Control internal padding in theorem-like boxes
#let insetvals = (x: .8em, top: 0.4em, bottom: 0.6em)

// Configure ctheorems
#let theorem = thmbox("theorem", "Theorem",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#e9b3c1"),
    breakable: mybreakable,
)

// Definining a "term" is less precise than "definition"
#let terminology = thmbox("term", "Term",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#dce2f7"),
    breakable: mybreakable,
)

#let definition = thmbox("definition", "Definition",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#dce2f7"),
    breakable: mybreakable,
)

#let remark_withnum = thmbox("remark", "Remark",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#e8e8f8"),
    breakable: mybreakable,
)

#let remark = remark_withnum.with(numbering: none)

#let notation = thmbox("notation", "Notation",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#aed2b2"),
    breakable: mybreakable,
)

#let caution = thmbox("caution", "Caution",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#e8edb0")
)
//).with(numbering: none)

#let example = thmbox("example", "Example",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#efe6ff"),
    breakable: mybreakable,
)

#let exercise = thmplain("exercise", "OldExercise",
    inset: insetvals,
    base_level: 1,
    breakable: mybreakable,
)

#let question = thmbox("question", "Question",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#fda59b"),
    breakable: mybreakable,
)

#let solution = thmplain("solution", "Solution",
).with(numbering: none)

#let solutionproof = thmproof("solution", "Solution",
).with(numbering: none)

#let proposition = thmbox("proposition", "Proposition",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#aed2b2"),
    breakable: mybreakable,
)

#let corollary = thmbox("corollary", "Corollary",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#aed2b2"),
    breakable: mybreakable,
)

#let lemma = thmbox("lemma", "Lemma",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#aed2b2"),
    breakable: mybreakable,
)

#let property = thmbox("property", "Property",
    inset: insetvals,
    base_level: 1,
    fill: rgb("#c8ccf9"),
    breakable: mybreakable,
)

#let proof = thmproof("proof", "Proof",
    inset: insetvals,
    fill: rgb("#d7fcd9"),
    breakable: mybreakable,
)

