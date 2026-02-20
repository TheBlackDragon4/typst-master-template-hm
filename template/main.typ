// #import "@preview/scribbling-hm:0.1.5": *
#import "glossary.typ" : glossary

// #set text(lang: "de", size: 12pt, region: "de")
// #set par(justify: true)
// #set page("a4")

#import "../lib.typ": *

#import "glossary.typ": glossary
#import "variables.typ": variables-list

#show: thesis.with(
  title: "HM Template für Typst",
  title-translation: "",
  university: "Hochschule für angewandte Wissenschaften",
  department: "Fakultät für Informatik und Mathematik",
  city: "München",
  course-of-study: "Informatik",
  study-focus: "Visual Computing und Künstliche Intelligenz",
  submission-date: datetime.today(),
  student-id: 12345678,
  author: "Erika Mustermann",
  supervisors1: "Prof. Dr. Max Mustermann",
  supervisors2: "Prof. Dr. Anna Musterfrau", 
  semester: "WiSe 2025/26",
  study-group: "IF7",
  birth-date: datetime(year: 2000, day: 1, month: 1),
  abstract-two-langs: true,
  abstract: none,
  abstract-translation: none,
  blocking: true,
  gender: "w",
  supervisor-gender: "m",
  bib: bibliography("references.bib", title: "Literaturverzeichnis"),
  glossary: glossary,
  variables-list: variables-list,
  draft: true,
  appendix: [
    #include("../src/components/99-appendix.typ")
  ],
)

#include("../template/example_usage.typ")
#include("../src/components/10-Introduction.typ")
// #include("../src/components/20-fundamentals.typ")
// #include("../src/components/30-methodology.typ")
// #include("../src/components/40-results.typ")
// #include("../src/components/50-summary-and-outlook.typ")
