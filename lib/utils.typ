#import "@preview/in-dexter:0.7.0": *
#import "@preview/t4t:0.4.3": get

// Wrap equation in `nonum` to suppress number the equation
#let nonum(eq) = math.equation(block: true, numbering: none, eq)

// Temporarily disable underlining, for example, of links
// Temporarily redefine the meaning of underline to mean nothing.
// Anything wrapped in this function that tries to underline will do nothing.
// Wow what a hack. This is the only thing I found.
#let nounderline(body) = {
  show underline: it => it.body
  body
}

// Use termin to bold a term and add it to the index.
// Probably never want to call this directly. We
// bold to introduce a term, in which case, we add
// a label as well.
#let termind(x) = {
    index[#x] // Add to index printed at end
    strong([#x])
}

#let termindbold(x) = {
    index[#x] // Add to index printed at end
    strong([#x])
}

// See this comment: https://forum.typst.app/t/how-to-create-something-like-emph-but-it-jumps-to-a-certain-place-in-the-pdf/3987/2
// Complicated :(
// define is the same as term, but also creates a link to the content.
// If the content is complex enough, eg with math, then `define` will
// fail. In this case, use `term` above.

// A label to add to words that are "defined"
#let deflabel(it) = label("define:" + get.text(it))

// Looks like define is the same as term, but it does not bold and index the term
#let define(it) = [#it#deflabel(it)]

#let term(it) = [#termindbold[#it]#deflabel(it)]

// Create a link to `it` via label defined with `define`.
// This should not style `it` in any way. `word` is meant to be
// used frequently in situations where you don't want to disrupt the visible flow.
// See `extword` below
#let word(it) = nounderline(link(deflabel(it), it))

// Print TODO then optionally, text
#let todo(..body) = {
    let txt = body.at(0, default: none)
    text(blue)[
        TODO:
        #txt
    ]
}

// Heading-like without being a numbered heading
#let nohead(txt) = {strong[#txt :]}

// Return true if `standalone` was passed on the command line, and is not 0
// typst compile --root=. --input standalone=true
#let isstandalone() = {
    sys.inputs.at("standalone", default: 0) != 0
}

// Render body only if `standalone` was *not* passed on the command line, and is not 0
#let notstandalone(..body) = {
    if not(isstandalone()) [#body.at(0)]
    //  else [
    //     Seems tat its isx
    // ]
}

// Render body only if `standalone` was passed on the command line, and is not 0
#let standalone(..body) = {
    if isstandalone() {
        body.at(0)
    } else if body.pos().len() == 2 {
        body.at(1)
    }
}

// External term with label.
// Link to the external label if the doc is not standalone
// If the doc *is* standalone, then the link will fail, so don't try.
#let extword(it) = {
    if isstandalone() {
        [#it]
    } else {
        word(it)
    }
}

