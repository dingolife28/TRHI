/// Die zwei Sprachen der Seite. Herzstück des „Bottleneck"-Prinzips: der
/// gesamte sichtbare Text fließt durch diese eine Auswahl.
enum AppLang { de, en }

extension AppLangPick on AppLang {
  /// Wählt je nach aktiver Sprache den deutschen oder englischen Wert.
  T pick<T>(T de, T en) => this == AppLang.de ? de : en;

  /// ISO-Code, u. a. für intl-Datumsformatierung.
  String get code => this == AppLang.de ? 'de' : 'en';
}
