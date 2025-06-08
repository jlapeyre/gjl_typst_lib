// Called math_gjl.typ to avoid clash with system math.typ
#import "./math_gjl.typ"

#import "./quill_ext.typ"
#import "./gjl_template.typ"
#import "./quantum.typ"
#import "./theorem_ext.typ"
#import "./utils.typ"
#import "./exercises.typ"


// There is no sanctioned way to document typst functions (and other code)
// There are some conventions, perhaps followed by tools
// Following is an example from t4t (tools4typst)

/// Clamps a value between `min` and `max`.
///
/// In contrast to #typ.clamp this function works for other values
/// than numbers, as long as they are comparable.
/// #codesnippet[```typ
/// text-size = math.clamp(0.8em, 1.2em, text-size)
/// ```]
/// Works with any comparable type.
///
/// // Tests
/// #utest(
///   `math.clamp(0, 100, 50) == 50`,
///   `math.clamp(33%, 99%, 100%) == 99%`,
///   `math.clamp(-5in, 8in, -6in) == -5in`,
///   `math.clamp(-5in, 8in, 4in) == 4in`,
/// )
///
/// - min (int, float, length, relative length, fraction, ratio): Minimum for `value`.
/// - min (int, float, length, relative length, fraction, ratio): Maximum for `value`.
/// - value (int, float, length, relative length, fraction, ratio): The value to clamp.
/// -> any




