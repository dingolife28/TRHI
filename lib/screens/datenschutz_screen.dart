import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer_widget.dart';

/// Datenschutzerklärung — Entwurf.
///
/// Der Analytics-/Cookie-Teil ist vollständig auf die tatsächliche Technik der
/// Seite abgestimmt (Google Consent Mode v2, GA4 lädt erst nach Einwilligung).
/// Die mit [BITTE ERGÄNZEN] markierten Stellen brauchen die echten Angaben des
/// Verantwortlichen; ein Impressum ist separat erforderlich.
class DatenschutzScreen extends StatelessWidget {
  const DatenschutzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final hPad = isMobile ? AppSpacing.xl : AppSpacing.band;

    return Scaffold(
      backgroundColor: AppColors.canvasDark,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),

                // Header band (dark)
                Container(
                  color: AppColors.canvasDark,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: hPad, vertical: AppSpacing.band),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rechtliches',
                          style: AppTextStyles.eyebrow.copyWith(
                              color: AppColors.brand, letterSpacing: 1.5)),
                      const SizedBox(height: AppSpacing.lg),
                      Text('Datenschutzerklärung',
                          style: AppTextStyles.displayLG
                              .copyWith(color: AppColors.onDark)),
                    ],
                  ),
                ),

                // Content (light)
                Container(
                  color: AppColors.canvasLight,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: hPad, vertical: AppSpacing.xxl),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 760),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _DraftNote(),
                          SizedBox(height: AppSpacing.xxl),

                          _H('1. Verantwortlicher'),
                          _P('Verantwortlich für die Datenverarbeitung auf dieser '
                              'Website ist:'),
                          _P('[BITTE ERGÄNZEN: Name / Firma]\n'
                              '[BITTE ERGÄNZEN: Anschrift]\n'
                              'E-Mail: [BITTE ERGÄNZEN: Kontakt-E-Mail]'),

                          _H('2. Hosting'),
                          _P('Die Website wird bei Cloudflare Pages gehostet '
                              '(Cloudflare, Inc., 101 Townsend St, San Francisco, '
                              'CA 94107, USA). Beim Aufruf der Seite verarbeitet '
                              'Cloudflare technisch notwendige Verbindungsdaten '
                              '(u. a. IP-Adresse, Datum und Uhrzeit, aufgerufene '
                              'URL, User-Agent), um die Seite auszuliefern und '
                              'gegen Angriffe zu schützen. Rechtsgrundlage ist '
                              'unser berechtigtes Interesse an einem sicheren und '
                              'stabilen Betrieb (Art. 6 Abs. 1 lit. f DSGVO). Die '
                              'Datenübermittlung in die USA ist über die '
                              'EU-Standardvertragsklauseln abgesichert.'),

                          _H('3. Schriftarten'),
                          _P('Diese Seite bindet Schriftarten von Google Fonts '
                              'ein. Dabei wird beim Laden eine Verbindung zu '
                              'Servern von Google hergestellt, wodurch Google die '
                              'IP-Adresse erhält. [HINWEIS: Für vollständige '
                              'DSGVO-Konformität sollten die Schriftarten lokal '
                              'ausgeliefert oder in die Einwilligung einbezogen '
                              'werden.]'),

                          _H('4. Cookies und Einwilligung'),
                          _P('Technisch notwendige Speicherungen (z. B. deine '
                              'gewählte Sprache, deine Cookie-Entscheidung) '
                              'erfolgen ohne Einwilligung auf Grundlage unseres '
                              'berechtigten Interesses (Art. 6 Abs. 1 lit. f '
                              'DSGVO). Deine Cookie-Entscheidung speichern wir '
                              '180 Tage lang lokal in deinem Browser '
                              '(localStorage, Schlüssel „trhi_consent_v1“); '
                              'danach fragen wir erneut.'),
                          _P('Statistik-Werkzeuge (siehe Abschnitt 5) werden erst '
                              'geladen und gesetzt, nachdem du im Banner aktiv '
                              'auf „Akzeptieren“ geklickt hast. Bis dahin bleibt '
                              'die Verarbeitung über Google Consent Mode v2 '
                              'vollständig deaktiviert. Deine Einwilligung kannst '
                              'du jederzeit mit Wirkung für die Zukunft '
                              'widerrufen – über den Button „Cookie-Einstellungen“ '
                              'unten links auf jeder Seite.'),

                          _H('5. Google Analytics 4'),
                          _P('Nach deiner Einwilligung nutzen wir Google '
                              'Analytics 4, einen Webanalysedienst der Google '
                              'Ireland Limited (Gordon House, Barrow Street, '
                              'Dublin 4, Irland). Google Analytics verwendet '
                              'Cookies und ähnliche Technologien, um die Nutzung '
                              'der Website auszuwerten (z. B. aufgerufene Seiten, '
                              'Verweildauer, ungefähre Herkunftsregion, '
                              'verwendetes Gerät). Die IP-Adresse wird von Google '
                              'gekürzt und nicht mit anderen Daten von Google '
                              'zusammengeführt.'),
                          _P('Rechtsgrundlage ist deine Einwilligung '
                              '(Art. 6 Abs. 1 lit. a DSGVO, § 25 Abs. 1 TTDSG). '
                              'Dabei können Daten an Server von Google, auch in '
                              'den USA, übermittelt werden; Google ist unter dem '
                              'EU-US Data Privacy Framework zertifiziert, '
                              'ergänzend gelten die EU-Standardvertragsklauseln. '
                              'Die in Google Analytics erfassten Daten werden '
                              'nach der im Konto eingestellten Aufbewahrungsfrist '
                              'automatisch gelöscht (Standard: 2 bis 14 Monate). '
                              'Widerruf: Button „Cookie-Einstellungen“ unten '
                              'links und dort „Ablehnen“ wählen.'),

                          _H('6. Terminanfrage / Kontaktformular'),
                          _P('Wenn du über das Formular ein Erstgespräch anfragst, '
                              'verarbeiten wir die von dir eingegebenen Angaben '
                              '(u. a. Name, E-Mail sowie deine freiwilligen '
                              'Angaben zu Trainingsstand und Anliegen), um deine '
                              'Anfrage zu bearbeiten und dich zu kontaktieren. '
                              'Rechtsgrundlage ist Art. 6 Abs. 1 lit. b DSGVO '
                              '(vorvertragliche Maßnahmen). Die Daten werden in '
                              'Google Cloud Firestore (Firebase) der Google '
                              'Ireland Limited gespeichert; auch hier gelten DPF '
                              'und EU-Standardvertragsklauseln. Wir löschen die '
                              'Anfrage, sobald sie abschließend bearbeitet ist '
                              'und keine Aufbewahrungspflichten entgegenstehen.'),

                          _H('7. Deine Rechte'),
                          _P('Du hast das Recht auf Auskunft, Berichtigung, '
                              'Löschung, Einschränkung der Verarbeitung, '
                              'Datenübertragbarkeit sowie Widerspruch gegen '
                              'Verarbeitungen auf Grundlage berechtigter '
                              'Interessen. Eine erteilte Einwilligung kannst du '
                              'jederzeit für die Zukunft widerrufen. Wende dich '
                              'dafür an die in Abschnitt 1 genannte Adresse.'),
                          _P('Außerdem hast du das Recht, dich bei einer '
                              'Datenschutz-Aufsichtsbehörde zu beschweren, '
                              'insbesondere in dem EU-Mitgliedstaat deines '
                              'Wohnsitzes oder des mutmaßlichen Verstoßes.'),

                          _H('8. Stand'),
                          _P('Diese Datenschutzerklärung ist ein Entwurf, Stand '
                              'August 2026, und wird bei Änderungen der '
                              'Verarbeitung angepasst.'),
                        ],
                      ),
                    ),
                  ),
                ),

                const FooterWidget(),
              ],
            ),
          ),
          const TrhiNavBar(),
        ],
      ),
    );
  }
}

class _DraftNote extends StatelessWidget {
  const _DraftNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.brand.withValues(alpha: 0.10),
        borderRadius: AppRadius.md,
        border: Border.all(color: AppColors.brand.withValues(alpha: 0.35)),
      ),
      child: Text(
        'Entwurf. Die mit [BITTE ERGÄNZEN] markierten Angaben müssen vor der '
        'Veröffentlichung eingesetzt und der Text sollte fachlich bzw. '
        'anwaltlich geprüft werden. Ein Impressum ist zusätzlich erforderlich.',
        style: AppTextStyles.bodySM.copyWith(color: AppColors.ink),
      ),
    );
  }
}

class _H extends StatelessWidget {
  final String text;
  const _H(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.sm),
      child: Text(text,
          style: AppTextStyles.headingSM.copyWith(color: AppColors.ink)),
    );
  }
}

class _P extends StatelessWidget {
  final String text;
  const _P(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Text(text,
          style: AppTextStyles.bodyMD.copyWith(color: AppColors.ink)),
    );
  }
}
