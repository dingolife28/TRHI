import 'package:flutter/material.dart';
import '../services/booking_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/language_scope.dart';

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
    final t = context.t;
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
          SnackBar(
            content: Text(t.bookingSuccess),
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
          SnackBar(
            content: Text(t.bookingError),
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
    final t = context.t;
    final isLight = MediaQuery.of(context).size.width >= Breakpoints.tablet;
    final textColor  = isLight ? AppColors.ink : AppColors.onDark;
    final mutedColor = isLight ? AppColors.stone : AppColors.onDarkMuted;
    final inputFill  = isLight ? AppColors.surfaceSoft : AppColors.surfaceElevated;
    final borderColor = isLight ? AppColors.hairlineLight : AppColors.hairlineDark;

    InputDecoration dec(String label, {String? hint}) => InputDecoration(
      labelText: label,
      hintText: hint,
      floatingLabelBehavior: hint != null
          ? FloatingLabelBehavior.always
          : FloatingLabelBehavior.auto,
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

    final isMobile = !isLight;
    return Padding(
      padding: EdgeInsets.all(isMobile ? AppSpacing.xl : AppSpacing.band),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionLabel(t.formPersonalSection, textColor),
            const SizedBox(height: AppSpacing.lg),

            if (isMobile) ...[
              TextFormField(
                controller: _firstName,
                decoration: dec(t.formFirstName),
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
                validator: (v) => (v == null || v.isEmpty) ? t.formRequired : null,
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _lastName,
                decoration: dec(t.formLastName),
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
                validator: (v) => (v == null || v.isEmpty) ? t.formRequired : null,
              ),
            ] else
              Row(children: [
                Expanded(child: TextFormField(
                  controller: _firstName,
                  decoration: dec(t.formFirstName),
                  style: AppTextStyles.bodyMD.copyWith(color: textColor),
                  validator: (v) => (v == null || v.isEmpty) ? t.formRequired : null,
                )),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: TextFormField(
                  controller: _lastName,
                  decoration: dec(t.formLastName),
                  style: AppTextStyles.bodyMD.copyWith(color: textColor),
                  validator: (v) => (v == null || v.isEmpty) ? t.formRequired : null,
                )),
              ]),
            const SizedBox(height: AppSpacing.lg),

            TextFormField(
              controller: _email,
              decoration: dec(t.formEmail),
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
              validator: (v) {
                if (v == null || v.isEmpty) return t.formRequired;
                if (!v.contains('@')) return t.formInvalidEmail;
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            TextFormField(
              controller: _phone,
              decoration: dec(t.formPhone),
              keyboardType: TextInputType.phone,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            _SectionLabel(t.formGoalsSection, textColor),
            Text(t.formGoalsHint,
                style: AppTextStyles.caption.copyWith(color: mutedColor)),
            const SizedBox(height: AppSpacing.lg),

            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: t.goals.map((g) {
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
              decoration: dec(t.formCustomGoal),
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            _SectionLabel(t.formBodySection, textColor),
            const SizedBox(height: AppSpacing.lg),

            if (isMobile) ...[
              TextFormField(
                controller: _age,
                decoration: dec(t.formAge, hint: t.formAgeHint),
                keyboardType: TextInputType.number,
                style: AppTextStyles.bodyMD.copyWith(color: textColor),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(children: [
                Expanded(child: TextFormField(
                  controller: _height,
                  decoration: dec(t.formHeight, hint: t.formHeightHint),
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.bodyMD.copyWith(color: textColor),
                )),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: TextFormField(
                  controller: _weight,
                  decoration: dec(t.formWeight, hint: t.formWeightHint),
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.bodyMD.copyWith(color: textColor),
                )),
              ]),
            ] else
              Row(children: [
                Expanded(child: TextFormField(
                  controller: _age,
                  decoration: dec(t.formAge, hint: t.formAgeHint),
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.bodyMD.copyWith(color: textColor),
                )),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: TextFormField(
                  controller: _height,
                  decoration: dec(t.formHeight, hint: t.formHeightHint),
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.bodyMD.copyWith(color: textColor),
                )),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: TextFormField(
                  controller: _weight,
                  decoration: dec(t.formWeight, hint: t.formWeightHint),
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.bodyMD.copyWith(color: textColor),
                )),
              ]),
            const SizedBox(height: AppSpacing.lg),

            TextFormField(
              controller: _injuries,
              decoration: dec(t.formInjuries, hint: t.formInjuriesHint),
              maxLines: 3,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            _SectionLabel(t.formActivitySection, textColor),
            const SizedBox(height: AppSpacing.lg),

            DropdownButtonFormField<String>(
              initialValue: _activityLevel,
              isExpanded: true,
              decoration: dec(t.formCurrentActivity),
              dropdownColor: isLight ? AppColors.canvasLight : AppColors.surfaceElevated,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
              items: t.activityLevels
                  .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                  .toList(),
              onChanged: (v) => setState(() => _activityLevel = v),
            ),
            const SizedBox(height: AppSpacing.lg),

            DropdownButtonFormField<String>(
              initialValue: _source,
              isExpanded: true,
              decoration: dec(t.formHowFound),
              dropdownColor: isLight ? AppColors.canvasLight : AppColors.surfaceElevated,
              style: AppTextStyles.bodyMD.copyWith(color: textColor),
              items: t.sources
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
                        t.formPrivacyConsent,
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
                  backgroundColor: isMobile ? AppColors.canvasLight : AppColors.canvasDark,
                  foregroundColor: isMobile ? AppColors.canvasDark : AppColors.onDark,
                  disabledBackgroundColor: AppColors.stone,
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
                  textStyle: AppTextStyles.buttonLG,
                ),
                child: _loading
                    ? const SizedBox(width: 20, height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2,
                            color: AppColors.onDark))
                    : Text(t.formSubmit),

              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            Text(t.formTrust,
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
