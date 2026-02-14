#import "../utils.typ": *

#let titlepage(
  title: none,
  title-translation: none,
  university: none,
  department: none,
  city: none,
  date: none,
  author: none,
  id: none,
  supervisors: none,
  course-of-study: none,
  gender: none,
  supervisor-gender: none,
  draft: true,
  date-today: none,
) = {
  align(center, [
    #v(1cm)
    #text(size: 17pt)[
    #university \ #city] 
    #v(0.8pt)
    #text(size: 14.4pt)[
    #department]

    #image("../media/HM_logo-small.png", width: 45%)

    #v(1cm)

    #text(size: 14.4pt)[Masterarbeit \ zur Erlangung des akademischen Grades \ Master of Science \
    im Studiengang #course-of-study]

    #v(1cm)

    #text(size: 25pt, weight: "bold", if (title != none) {
      title
    } else {
      todo[Titel]
    })

    #text(size: 14pt, if (title-translation != none) {
      title-translation
    } else { todo[Title] })
  ])

  // Vertical spacing before the separator line
  v(1cm)
  v(1cm)
  v(1cm)
  
  // Horizontal separator line
  line(length: 100%, stroke: 1pt)
  
  v(1cm)

  // Left-aligned table with information
  pad(left: 5%, right: 20%,
    grid(
      columns: (auto, 1fr),
      column-gutter: 3em,
      row-gutter: 1em,
      
      // Autor
      [Autor:],
      if (author != none) { author } else { todo[Autor] },
      
      // Cadastral number
      [Matrikelnummer:],
      if (id != none) { str(id) } else { todo[Matrikelnummer] },
      
      // Submission date
      [Abgabedatum:],
      if draft {
        text(hm-color)[
          ENTWURF Stand: #date-today]
      } else {
        if (date != none) { date } else { todo[#submission-date] }
      },
      
      // Task setter/examiner
      if supervisor-gender == "m" {
        [Betreuer:]
      } else if supervisor-gender == "w" {
        [Betreuerin:]
      } else {
        [Betreuende Person:]
      },
      if (supervisors != none) {
        if type(supervisors) == array {
          supervisors.join(", ")
        } else {
          supervisors
        }
      } else {
        todo[Betreuer]
      },
    )
  )
  pagebreak()
}
