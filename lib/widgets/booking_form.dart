import 'package:flutter/material.dart';
import '../services/booking_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';

const _goals = [
  '🔥 Abnehmen', '💪 Muskelaufbau', '🦵 Mehr Beweglichkeit',
  '🦴 Weniger Rückenschmerzen', '⚡ Mehr Energie im Alltag',
  '🏃 Ausdauer verbessern', '🧘 Stressabbau', '🏕 Training Camp',
  '🏅 Wettkampf-Vorbereitung', '🦺 Verletzungsrehabilitation',
  '🧓 Fit im Alter bleiben', '🏋 Körperhaltung verbessern',
  '😴 Besser schlafen', '🌿 Gesündere Ernährung',
];

const _activityLevels = [
  'Kein Sport seit längerem',
  'Leichte Bewegung (Spazieren, Yoga)',
  '1–2× Sport pro Woche',
  '3–4× Sport pro Woche',
  'Tägliches Training',
  'Leistungssport / Wettkampf',
];

const _sources = [
  'YouTube', 'Instagram', 'Empfehlung', 'Google', 'Sticker/Flyer', 'Sonstiges',
];

class BookingForm extends StatefulWidget {
  final String sessionType;
  final String? timeSlot;

  const BookingForm({super.key, required this.sessionType, this.timeSlot});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstName   = TextEditingController();
  final _lastName    = TextEditingController();
  final _email       = TextEditingController();
  final _phone       = TextEditingController();
  final _customGoal  = TextEditingController();
  final _age         = TextEditingController();
  final _height      = TextEditingController();
  final _weight      = TextEditingController();
  final _injuries    = TextEditingController();

  final Set<String> _selectedGoals = {};
  String? _activityLevel;
  String? _source;
  bool _loading = false;
  bool _privacyAccepted = false;

  @override
  void dispose() {
    for (final c in [_firstName, _lastName, _email, _phone, _customGoal,
                     _age, _height, _weight, _injuries]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      await BookingService.submit(
        firstName:     _firstName.text.trim(),
        lastName:      _lastName.text.trim(),
        email:         _email.text.trim(),
        phone:         _phone.text.trim(),
        sessionType:   widget.sessionType,
        timeSlot:      widget.timeSlot,
        goals:         _selectedGoals.toList(),
        customGoal:    _customGoal.text.trim(),
        age:           int.tryParse(_age.text),
        height:        int.tryParse(_height.text),
        weight:        int.tryParse(_weight.text),
        injuries:      _injuries.text.trim(),
        activityLevel: _activityLevel,
        source:        _source,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Anfrage gesendet — wir melden uns innerhalb 24h!'),
            backgroundColor: AppColors.brand,
          ),
        );
        _formKey.currentState!.reset();
        _selectedGoals.clear();
        setState(() { _activityLevel = null; _source = null; _privacyAccepted = false; });
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fehler beim Senden. Bitte nochmal versuchen.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLight = MediaQuery.of(context).size.width >= Breakpoints.tablet;
    final textColor  = isLight ? AppColors.ink : AppColors.onDark;
    final mutedColor = isLight ? AppColors.stone : AppColors.onDarkMuted;
    final inputFill  = isLight ? AppColors.surfaceSoft : AppColors.surfaceElevated;
    final borderColor = isLight ? AppColors.hairlineLight : AppColors.hairlineDark;

    InputDecoration dec(String label, {String? hint}) => InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: AppTextStyles.label.copyWith(color: mutedColor),
      hintStyle: AppTextStyles.caption.copyWith(color: mutedColor),
      filled: true,
      fillColor: inputFill,
      border: OutlineInputBorder(borderRadius: AppRadius.md,
          borderSide: BorderSide(color: borderColor)),
      enabledBorder: OutlineInputBorder(borderRadius: AppRadius.md,
          borderSide: BorderSide(color: borderColor)),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg, vertical: AppSpacing.md),
    );

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.band),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionLabel('Persönliche Daten', textColor),
            const SizedBox(height: AppSpacing.lg),

            Row(children: [
              Expanded(child: TextFormField(
                controller: _firstName,
                decoration: dec('Vorname *'),
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
                validator: (v) => (v == null || v.isEmpty) ? 'Pflichtfeld' : null,
              )),
              const SizedBox(width: AppSpacing.lg),
              Expanded(child: TextFormField(
                controller: _lastName,
                decoration: dec('Nachname *'),
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
                validator: (v) => (v == null || v.isEmpty) ? 'Pflichtfeld' : null,
              )),
            ]),
            const SizedBox(height: AppSpacing.lg),

            TextFormField(
              controller: _email,
              decoration: dec('E-Mail *'),
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Pflichtfeld';
                if (!v.contains('@')) return 'Ungültige E-Mail';
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            TextFormField(
              controller: _phone,
              decoration: dec('Telefon (optional)'),
              keyboardType: TextInputType.phone,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            _SectionLabel('Was möchtest du erreichen?', textColor),
            Text('Mehrere Ziele möglich.',
                style: AppTextStyles.caption.copyWith(color: mutedColor)),
            const SizedBox(height: AppSpacing.lg),

            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: _goals.map((g) {
                final sel = _selectedGoals.contains(g);
                return GestureDetector(
                  onTap: () => setState(() =>
                      sel ? _selectedGoals.remove(g) : _selectedGoals.add(g)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
                    decoration: BoxDecoration(
                      color: sel ? AppColors.brand : inputFill,
                      borderRadius: AppRadius.full,
                      border: Border.all(
                          color: sel ? AppColors.brand : borderColor),
                    ),
                    child: Text(g,
                        style: AppTextStyles.label.copyWith(
                            color: sel ? AppColors.onDark : textColor)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.lg),

            TextFormField(
              controller: _customGoal,
              decoration: dec('Eigenes Ziel (optional)'),
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            _SectionLabel('Körperdaten', textColor),
            const SizedBox(height: AppSpacing.lg),

            Row(children: [
              Expanded(child: TextFormField(
                controller: _age,
                decoration: dec('Alter', hint: '16–99'),
                keyboardType: TextInputType.number,
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
              )),
              const SizedBox(width: AppSpacing.lg),
              Expanded(child: TextFormField(
                controller: _height,
                decoration: dec('Größe (cm)', hint: '140–220'),
                keyboardType: TextInputType.number,
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
              )),
              const SizedBox(width: AppSpacing.lg),
              Expanded(child: TextFormField(
                controller: _weight,
                decoration: dec('Gewicht (kg)', hint: '40–200'),
                keyboardType: TextInputType.number,
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
              )),
            ]),
            const SizedBox(height: AppSpacing.lg),

            TextFormField(
              controller: _injuries,
              decoration: dec('Verletzungen / Beschwerden (optional)',
                  hint: 'z.B. Knieschmerzen links, Bandscheibe L4/L5…'),
              maxLines: 3,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            _SectionLabel('Aktivitätslevel', textColor),
            const SizedBox(height: AppSpacing.lg),

            DropdownButtonFormField<String>(
              initialValue: _activityLevel,
              decoration: dec('Aktuelles Aktivitätslevel'),
              dropdownColor: isLight ? AppColors.canvasLight : AppColors.surfaceElevated,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
              items: _activityLevels
                  .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                  .toList(),
              onChanged: (v) => setState(() => _activityLevel = v),
            ),
            const SizedBox(height: AppSpacing.lg),

            DropdownButtonFormField<String>(
              initialValue: _source,
              decoration: dec('Wie hast du TRHI gefunden?'),
              dropdownColor: isLight ? AppColors.canvasLight : AppColors.surfaceElevated,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
              items: _sources
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (v) => setState(() => _source = v),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            // DSGVO consent
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: _privacyAccepted,
                  onChanged: (v) => setState(() => _privacyAccepted = v ?? false),
                  activeColor: AppColors.brand,
                  side: BorderSide(color: borderColor),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _privacyAccepted = !_privacyAccepted),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Ich stimme zu, dass meine Angaben zur Bearbeitung '
                        'meiner Anfrage gespeichert werden. '
                        'Details in der Datenschutzerklärung.',
                        style: AppTextStyles.caption.copyWith(color: mutedColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: (_loading || !_privacyAccepted) ? null : _submit,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.canvasDark,
                  foregroundColor: AppColors.onDark,
                  disabledBackgroundColor: AppColors.stone,
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
                  textStyle: AppTextStyles.buttonLG,
                ),
                child: _loading
                    ? const SizedBox(width: 20, height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2,
                            color: AppColors.onDark))
                    : const Text('Termin anfragen →'),

              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            Text('✓ Antwort innerhalb 24h · Kein Spam · Kein Verkaufsdruck',
                style: AppTextStyles.caption.copyWith(color: mutedColor),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  final Color color;
  const _SectionLabel(this.text, this.color);

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTextStyles.headingSM.copyWith(color: color));
}
