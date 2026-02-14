#let blocking-notice(
  gender: none
) = {

  let author = if gender == "w" [der Verfasserin] else if gender == "m" [des Verfassers] else [des Verfassenden]

  v(1fr)

  [
    Die vorliegende Masterarbeit beinhaltet vertrauliche Informationen und darf durch Dritte, mit Ausnahme der Gutachter und berechtigten Beteiligten im Prüfungsverfahren, ohne ausdrückliche schriftliche Zustimmung #author nicht eingesehen werden.

    Insbesondere ist eine Vervielfältigung, weitere Verwendung und eine Veröffentlichung der Masterarbeit ohne ausdrückliche schriftliche Genehmigung #author, auch auszugsweise, untersagt.

  ]

  v(1fr)
}
