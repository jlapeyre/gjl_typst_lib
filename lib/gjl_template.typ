// This file is currently useless because I don't know how to import/include it.
// When I *do* import or include, I get error messages as if it were not
// present at all.
// I think the answer is to use a template
// https://typst.app/docs/tutorial/making-a-template/

#import "@preview/ctheorems:1.1.3": *

#let gjl_template(doc) = [

    // Alternatively, we could put all of our theorem code in a template
    // But this is needed in order to render theorem-like things at all.
    // The fact that I specify the symbol is irrelevant. This is docuemented
    #show: thmrules.with(qed-symbol: $square$)

    // This causes the title on the title page to be formatted poorly
    // Justify text, both left and right
    #set par(justify: true)

    // When numbering is off, then heading is not really a "heading"
    // And I prefer text centered. IDK, slightly fragile and hacky
    #show heading.where(numbering: none): set align(center)

    // This affects the table of contents (rendered with `outline()`)
    #set heading(numbering: "1.1")

    // Reset counter at each top-level heading.
    // If you want to change the number of displayed
    // section numbers, change the level there
    #show heading.where(level:1): it => {
        counter(math.equation).update(0)
        it
    }

    // Format equation references.
    // Uses the top-level heading number first
    #set math.equation(numbering: n => {
        numbering("(1.1)", counter(heading).get().first(), n)})

    // References to equations are modified from "Equation (x.y)"
    // to "(x.y)".
    // This is hacky because "(1.1)" is hardcoded.
    #show ref: it => {
        let eq = math.equation
        let el = it.element
        if el != none and el.func() == eq {
            link(el.location(),
                numbering(
//                    el.numbering,
                    "(1.1)",
                    counter(heading).at(el.location()).first(),
                    counter(eq).at(el.location()).first()
                )
            )
        } else {
            // Other references as usual.
            it
        }
    }

    // Suppress equation numbering if there is no label.
    // This is probably buggy. There are alot of partial solutions to this on the forum.
    #show math.equation: it => {
        if it.block and not it.has("label") [
            #math.equation(it.body, block: true, numbering: none)#label("")
            #counter(math.equation).update(
                v => if v >= 1 {
                    v - 1
                }
                else {
                    v
                })
        ] else {
            it
        }
    }

    #show figure.caption: it => {
        set align(left)
        it
    }

    #doc
]

    // Following works ok. As well as above one, I suppose.
    // References to equations are modified from "Equation (x.y)"
    // to "(x.y)".
    // This is hacky.
    // https://forum.typst.app/t/how-to-correctly-customize-equation-numbering-referencing-simultaneously/2485/3
    // #show ref: it => {
    //     let el = it.element
    //     if (el != none and el.func() == math.equation) {
    //         // May need to adjust this when using letters in numbering
    //         show regex("\p{letter}+\s+"): none
    //         it
    //     } else {
    //         it
    //     }
    // }

    // Following is broken as well, when used in conjunction with numbering equations
    // by top level heading number.
    // In "(x.y)" it uses the current top-level number
    // instead of the corresponding number where the equation appears.
    // References to equations are modified from "Equation (x.y)"
    // to "(x.y)".
    // #show ref: it => {
    //     let eq = math.equation
    //     let el = it.element
    //     if el != none and el.func() == eq {
    //         // Override equation references.
    //         link(el.location(),numbering(
    //             el.numbering,
    //             ..counter(eq).at(el.location())
    //         ))
    //     } else {
    //         // Other references as usual.
    //         it
    //     }
    // }
