// Write exercise/solution pairs, where the exercise and solution appear next to each other
// in the source file, but are separated in the rendered document.
//
// In particular, the solutions are collected and rendered together in one place.  Exercises
// are numbered automatically. The solutions include a title that links back to the
// statements of the exercises.

// Example:
//
// #problem(
//     statement: [ Show that 1 + 2 = 3],
//     solution: proof[
//         $
//             3 &= 1 + 1 + 1\
//                 &= 1 + 2
//         $
//     ]
// )
//
// Put this line where you want the solutions to appear
// #display-solutions()
//
// TODO: Designed largely by users on typst user forum. Give them credit!


#let all-problems = state("all-problems", ())
#let problem-counter = counter("problem")

#let problem(statement: [], solution: none) = {
    problem-counter.step()
    context {
        let h1-num = counter(heading).get().first()
        let problem-number = numbering("1.1", h1-num, ..problem-counter.get())
        let name = [Exercise #problem-number]
        let problem = (solution: solution, location: here(), name: name)
        all-problems.update(problems => problems + (problem,))
        block[_#name:_ #statement]
    }
}

#let display-solutions() = context for p in all-problems.get() {
    if p.solution == none { continue }
    let exercise-link = link(p.location, emph(p.name))
    block(breakable: false, [_Solution:_ #exercise-link#h(1em)#p.solution])
}

#set heading(numbering: "1.1")
#show heading.where(level: 1): it => it + problem-counter.update(0)
