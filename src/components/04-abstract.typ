#import "../libs/utils.typ": *

#let abstract-page(
  two-langs: true,
  abstract: none,
  abstract-translation: none
) = {
  heading("Zusammenfassung", outlined: false)

  text(if abstract != none {abstract} else {lorem(100)})

  if two-langs == true {
    heading("Abstract", outlined: false)

    text(if abstract-translation != none {abstract-translation} else {lorem(100)})
  }

  pagebreak()
}