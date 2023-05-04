Might end up writing for the following existing generics:

- print /show
- summary
- plot 



# S3

generic function OOP

methods belong to generic functions

- method despatch: match the action (method) with the object (class)

No way to define a class in S3; but there is in S4

Base types (only added by R core team)

type in `mean`, it says `UseMethod("mean")`: this means this is not a function by itself, it is a generic function

multiple classes:  tibble could have `tbl_df`, `tbl`, `data.frame` classes (inheritance). When it looks for methods, it looks for tbl-df first.



# S4

generic function OOP





# R6

encapsulated OOP (most other, e.g. python, c++)

methods belong to the objects or classes, `object.method()`

`R6Class()`

- `classname`, by convention it has `UpperCamelCase`
- `public`, `snake_case`



