#import "utils.typ": *

#let thesis(
  title: none,
  title-translation: none,
  author: none,
  gender: none,
  student-id: none,
  birth-date: none,
  university: "",
  department: "",
  city: "",
  study-group: "",
  semester: "",
  focus: none,
  supervisors1: none,
  supervisors2: none,
  supervisor-gender: none,
  submission-date: none,
  abstract-two-langs: true,
  abstract: none,
  abstract-translation: none,
  blocking: false,
  enable-header: true,
  draft: true,
  bib: none,
  glossary: none,
  course-of-study: none,
  variables-list: none,
  appendix: none,
  body,
) = {
  if gender != none and gender not in ("m", "w", "d") {
    panic("Gender must be one of: 'm', 'w', 'd', or none")
  }
  if supervisor-gender != none and supervisor-gender not in ("m", "w", "d") {
    panic("Supervisor's gender must be one of: 'm', 'w', 'd', or none")
  }

  let lang = "de"

  state("draft", draft).update(draft)

  set document(author: if (author != none) { author } else { "" }, title: title, date: submission-date)

  set page(
    paper: "a4",
    margin: 2.5cm,
    binding: left,
    footer: context {
      let page-numbering = page.numbering
      if page-numbering != none [
        #line(length: 100%, stroke: 0.05em)
        #v(-0.5em)
        #align(right, counter(page).display(page-numbering))
      ]
    },
  )

  // draft-based accents
  set cite(
    style: "ieee",
  )
  // show cite: set text(fill: if draft { orange } else { black })
  // show footnote: set text(fill: if draft { purple } else { black })
  // ---

  set par(
    justify: true,
  )

  show heading.where(level: 1): set block(below: 0.5cm)
  show heading.where(level: 2): set block(below: 0.5cm)
  show heading.where(level: 3): it => {
    set block(below: 0.5cm)
    set text(size: 1.1em)
    it
  }
  show heading.where(level: 5): set text(weight: "semibold")

  set text(
    lang: lang,
    region: lang,
  )

  set list(
    tight: false,
    indent: 10pt
  )

  set enum(
    tight: false,
    indent: 10pt
  )

  show: make-glossary

  show: zebraw.with(
    background-color: rgb(251, 251, 251, 255),
    numbering-separator: true,
    lang-color: hm-color.lighten(50%)
  )
  show raw.where(block: true): set text(0.9em)

  // titlepage
  import "../components/00-titlepage.typ": titlepage

  titlepage(
    title: title,
    title-translation: title-translation,
    university: university,
    department: department,
    city: city,
    author: author,
    supervisors1: supervisors1,
    supervisors2: supervisors2,
    date: custom-date-format(submission-date, lang: lang, pattern: "long"),
    id: student-id,
    gender: gender,
    supervisor-gender: supervisor-gender,
    draft: draft,
    course-of-study: course-of-study,
    date-today: custom-date-format(datetime.today(), lang: lang, pattern: "long"),
  )

  // ---

  // blocking notice
  if blocking {
    import "../components/01-blocking.typ": blocking-notice

    blocking-notice(
      gender: gender,
    )

    pagebreak()
  }

  // ---

  // declaration of independent writing

  import "../components/02-declaration.typ": declaration

  declaration(
    submission-date: custom-date-format(submission-date, lang: lang, pattern: "long"),
    name: author,
    student-id: student-id,
    semester: semester,
    study-group: study-group,
    birth-date: if (birth-date != none) { custom-date-format(birth-date, lang: lang, pattern: "dd.MM.yyyy") },
  )
  
  pagebreak()
  
  // ---

  // acknowledgments 
  import "../components/03-acknowledgments.typ": acknowledgments

  acknowledgments(
    title: "Danksagung",
  )
  // -- acknowledgments 

  // ---

  set page(
    numbering: "i",
  )
  counter(page).update(1)

 // abstract
  import "../components/04-abstract.typ": abstract-page

  abstract-page(
    two-langs: abstract-two-langs,
    abstract: abstract,
    abstract-translation: abstract-translation,
  )
  // -- abstract
  
  // list of figures
  heading([Abbildungsverzeichnis], level: 1)
  outline(
    title: none,
    target: figure.where(kind: image),
  )
  pagebreak()
  // -- list of figures

  // list of tables
  heading([Tabellenverzeichnis], level: 1)
  outline(
    title: none,
    target: figure.where(kind: table),
  )
  pagebreak()
  // -- list of tables

  // list of code
  heading([Codeverzeichnis], level: 1)
  outline(
    title: none,
    target: figure.where(kind: raw),
  )
  pagebreak()
  // -- list of code

  // glossar
  register-glossary(glossary)

  heading([Glossar], level: 1)

  print-glossary(glossary, disable-back-references: true, shorthands: ("plural", "capitalize", "capitalize-plural", "short", "long", "longplural"))
  
  pagebreak()
  // -- glossar

  // toc
  import "../libs/outline.typ": outline-page

  outline-page()
  // -- toc

  set page(
    numbering: "1",
  )
  counter(page).update(1)

  set page(
    header: if enable-header {
      text(context {
        let headings = query(heading.where(level: 1))
        let current-page = here().page()

        let current-heading = none
        for h in headings {
          if h.location().page() == current-page {
            current-heading = h
            break
          } else if h.location().page() > current-page {
            break
          }
        }

        if current-heading == none {
          for h in headings {
            if h.location().page() < current-page {
              current-heading = h
            } else {
              break
            }
          }
        }

        if current-heading != none {
          let heading-counter = counter(heading).at(current-heading.location())
          if heading-counter.len() > 0 {
            numbering("1", ..heading-counter)
            [ ]
          }
          current-heading.body
          h(1fr)
          if draft {
            [
              #text(hm-color)[ENTWURF -- Stand: #custom-date-format(datetime.today(), lang: lang, pattern: "dd.MM.y")]
            ]
          }
        }
      })
      v(-0.5em)
      line(length: 100%, stroke: 0.05em)
    },
  )

  register-glossary(variables-list)
  print-glossary(variables-list, invisible: true, disable-back-references: true)

  // pagebreak before every level 1 heading
  show heading.where(depth: 1): it => {
    pagebreak(weak: true)
    it
  }

  show heading.where(level: 1): set heading(numbering: "1",)
  show heading.where(level: 2): set heading(numbering: "1.1")
  show heading.where(level: 3): set heading(numbering: "1.1.1")
  show heading.where(level: 4): set heading(numbering: "1.1.1.1")
  show heading: set heading(supplement: [Kapitel])

  let variables-keys = variables-list.map(e => e.key).filter(k => k != none).dedup()
  show link: it => {
    if (type(it.dest) == str) {
      it
    } else {
      if (variables-keys.any(k => repr(it.dest).contains(k))) {
        it.body
      } else {
        it
      }
    }
  }

  body

  show heading: set heading(numbering: none)

  set page(header: none)

  pagebreak()

  bib

  if appendix != none {
    pagebreak()
    heading([Anhang], level: 1)
    appendix
  }

}
