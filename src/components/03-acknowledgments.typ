#import "../utils.typ": *

#let acknowledgments(
  title: "Danksagung",
) = {
  // Empty page style (no header/footer)
  set page(header: none, footer: none, numbering: none)
  
  v(2cm)
  
  align(center)[
    #text(size: 16pt, weight: "bold")[#title]
  ]
  
  v(1cm)
  
  [
    Wenn Sie möchten, können Sie diesen Abschnitt nutzen, um Ihren Betreuern, Ihren Universitäten oder einfach allen anderen zu danken, die Ihnen beim Verfassen Ihrer Abschlussarbeit geholfen haben.
    Für diese Vorlage möchte ich diesen Abschnitt jedoch für eine kleine Bitte missbrauchen:
    Ich möchte, dass diese Vorlage für so viele großartige Abschlussarbeiten wie möglich verwendet wird.
    Daher muss diese Vorlage bekannt gemacht werden.
    Bitte erzählen Sie Ihren Kollegen und Betreuern davon.
Vielen Dank für Ihre Hilfe!
  ]
  
  pagebreak()
}
