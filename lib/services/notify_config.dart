/// Konfiguration für die kostenlose Buchungs-Benachrichtigung.
///
/// Web3Forms (https://web3forms.com) ist gratis: 250 E-Mails/Monat, kein
/// Server, kein Account — du hinterlegst eine E-Mail-Adresse und bekommst per
/// Mail einen Access Key. Bei jeder Anmeldung sendet die Website darüber eine
/// E-Mail an genau diese Adresse.
///
/// Den Key entweder direkt unten als [defaultValue] eintragen ODER beim Build
/// per `--dart-define=WEB3FORMS_KEY=dein-key` übergeben (empfohlen für CI,
/// damit der Key nicht im Repo landet).
class NotifyConfig {
  static const web3formsAccessKey =
      String.fromEnvironment('WEB3FORMS_KEY', defaultValue: '');
}
