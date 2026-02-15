
= Template Usage
Small guide on how to use the template and its features to write a thesis in the @hm.

== Using Abbreviations and Variables

Use `@acronym` to insert abbreviations. The first mention will be fully expanded, afterwards only the short form.

Example: This @typst formatting is defined in the variables list. The @cpu processes data. Another @cpu reference.

@api are used to define the interaction between different software systems @iso18004.

Only the first occurrence of an acronym will be expanded, like this @http.

== Displaying Source Code

In the following example, Python code is displayed with syntax highlighting:

#figure(
  ```python
  def example_function(a: int, b: int) -> int:
      print("Hello, World!")
      return a + b
  ```,
  caption: [Example of Python Code]
) <code:python>

For inline code, use the syntax \`\`\`py CODE \`\`\`: ```py function(a: int) -> int```. 

Other supported languages:

#figure(
  ```rust
  fn main() {
      let result = add(5, 3);
      println!("Result: {}", result);
  }
  
  fn add(a: i32, b: i32) -> i32 {
      a + b
  }
  ```,
  caption: [Example of Rust Code]
)

#pagebreak()

== Tables

For tables, you can use Typst's standard `table` function:

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: (left, left, left),
    stroke: 0.5pt,
    fill: (col, row) => if row == 0 { gray.lighten(60%) },
    table.header([*Platform*], [*Adapter*], [*Data*]),
    [Drone], [
      - WiFi
      - LTE
    ], [
      - Mission data
      - Camera feed
      - Flight information
    ],
    [Car], [
      - LTE
    ], [
      - Route information
      - Maintenance data
    ],
    [Truck], [
      - LoRaWAN
      - LTE
    ], [
      - Driving & rest times
      - Loading information
      - Maintenance data
    ],
  ),
  caption: [Example table with different platforms]
) <tab:platforms>

Reference to the table: See @tab:platforms for details.

== Lists

Unordered lists:

- First item
- Second item
  - Sub-item A
  - Sub-item B
- Third item

Numbered lists:

+ First step
+ Second step
  + Sub-step a
  + Sub-step b
+ Third step

== Images

#figure(
  image("../src/assets/HM_logo.png", width: 60%),
  caption: [Example picture - HM Logo]
) <fig:architecture>

An example image can be seen in @fig:architecture.

#pagebreak()

== Mathematical Formulas

Inline math: The formula $E = m c^2$ is well known.

Block math:

$ 
f(x) = integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2
$

More complex formulas:

$
sum_(i=1)^n i = (n(n+1))/2
$

== Footnotes

Text with footnote #footnote[This is a footnote with additional information.] in running text.

== Citations and References

If you want to reference literature (make sure entries exist in `references.bib`), use the syntax `@citation_key`.

== Cross-References

- To figures: @fig:architecture
- To tables: @tab:platforms  
- To code: @code:python
- To chapters: @template-structure

= Template Structure <template-structure>

== Main File

The `main.typ` is the entry point:
- Import of the template (`#import "../lib.typ": *`)
- Configuration with `#show: thesis.with(...)`
- Main content of the thesis

== Components

The template consists of several components:
- `00-titlepage.typ` - Title page
- `01-blocking.typ` - Blocking notice
- `02-declaration.typ` - Declaration of authorship
- `03-acknowledgments.typ` - Acknowledgments
- `04-abstract.typ` - Abstract
- `glossary.typ` - Glossary
- `outline.typ` - Table of contents
- `10-Introduction.typ` - Introduction chapter
- `20-fundamentals.typ` - Fundamentals chapter
- `30-methodology.typ` - Methodology chapter
- `40-results.typ` - Results chapter
- `50-summary-and-outlook.typ` - Summary and outlook chapter
- `99-appendix.typ` - Appendix



