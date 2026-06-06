# `gjl_typst_lib`

## What

My personal typst libraries

Typst makes it very difficult to load files from arbitrary file paths on your disk.
This is for legitimate security concerns.

So to share your personal libraries with two projects that may be at any path, the
easiest thing is to follow the whole packaging rigamarole, although that's not too hard.
Then install to the typst-precsribed location for locally installed libraries.


## Example

```typst
#import "@local/gjl_typst_lib:1.1.1"

#gjl_typst_lib.math_gjl.Cc

#import gjl_typst_lib.quantum: *

$ket(0)$

Hi there.
```

## Caution

AFAIK, I am the only person using this library. So I sometimes modify the library without
changing the version number.
