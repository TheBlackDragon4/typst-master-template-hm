// #import "@preview/scribbling-hm:0.1.5": *
#import "@preview/charged-ieee:0.1.4": ieee

#set text(lang: "de", size: 12pt, region: "de")
#set par(justify: true)
#set page("a4")
#import "../lib.typ": *

#import "abbreviations.typ": abbreviations-list
#import "variables.typ": variables-list

#show: thesis.with(
  title: "Distributed Real-Time Java
for Cloud Based Applications",
  title-translation: "",
  university: "Hochschule für angewandte Wissenschaften",
  department: "Fakultät für Informatik und Mathematik",
  city: "München",
  course-of-study: "Informatik",
  submission-date: datetime.today(),
  student-id: 12345678,
  author: "Erika Mustermann",
  supervisors: "Prof. Dr. Max Mustermann",
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
  abbreviations-list: abbreviations-list,
  variables-list: variables-list,
  draft: false,
  appendix: [
    == Anhang A: Lorem ipsum 1
    #lorem(250)
    
    == Anhang B: Lorem ipsum 2
    #lorem(250)
  ],
)

= Einleitung
#lorem(100)

== Motivation
#lorem(80)

== Zielsetzung
#lorem(60)

= Grundlagen
#lorem(120)

== Technischer Hintergrund
This @typst @typst_doc formatting is defined in the variables list. It is processed by a @cpu. Another sentence using @cpu. #footnote[A third @cpu sentence maybe?]

#lorem(50)

== Stand der Forschung
#lorem(90)

Bullet points are indented by default:

- first
- second
  - first
  - second
- third

Numbered lists too:

+ first
+ second
  + first
  + second
+ third

= Methodik
#lorem(100)

== Implementierung
#lorem(70)

#figure(
  ```rust
  fn main() {
      println!("Hello World!");
  }
  ```,
  caption: ["Hello World" in Rust]
)

#lorem(40)

// Beispiel für eine Tabelle
#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr),
    align: (left, center, center, center),
    stroke: 0.5pt,
    fill: (col, row) => if row == 0 { gray.lighten(60%) },
    [*Method*], [*Accuracy*], [*Time (ms)*], [*Storage (MB)*],
    [Algorithmus A], [94.2%], [150], [512],
    [Algorithmus B], [96.8%], [230], [768],
    [Algorithmus C], [91.5%], [95], [384],
    [Baseline], [88.0%], [80], [256],
  ),
  caption: [Vergleich verschiedener Algorithmen]
) <tab:algorithmen>

#lorem(30)

// Example of an image
#figure(
  image("../src/media/HM_logo.png", width: 60%),
  caption: [Example picture - HM Logo]
) <fig:architektur>

In @tab:algorithmen sehen wir einen Vergleich der verschiedenen Algorithmen. Ein Beispielbild ist in @fig:architektur zu sehen.

#lorem(20)

== Evaluierung
#lorem(80)

= Ergebnisse
#lorem(150)

== Analyse
#lorem(90)

== Diskussion
#lorem(100)

= Zusammenfassung und Ausblick
#lorem(80)

== Zusammenfassung
#lorem(60)

== Ausblick
#lorem(50)