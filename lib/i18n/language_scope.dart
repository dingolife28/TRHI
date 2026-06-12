import 'package:flutter/widgets.dart';
import 'app_lang.dart';
import 'app_text.dart';
import 'language_controller.dart';

/// Stellt die aktive Sprache im Widget-Baum bereit. Als [InheritedNotifier]
/// werden genau die Widgets neu gebaut, die über [BuildContext.lang] oder
/// [BuildContext.t] darauf zugreifen — der „Bottleneck" in Reinform.
class LanguageScope extends InheritedNotifier<LanguageController> {
  const LanguageScope({
    super.key,
    required LanguageController controller,
    required super.child,
  }) : super(notifier: controller);

  static LanguageController controllerOf(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LanguageScope>();
    assert(scope != null, 'LanguageScope fehlt im Widget-Baum');
    return scope!.notifier!;
  }

  static AppLang of(BuildContext context) => controllerOf(context).lang;
}

extension LanguageContext on BuildContext {
  /// Aktive Sprache. Der Zugriff registriert das Widget als Abhängigkeit →
  /// Rebuild beim Umschalten.
  AppLang get lang => LanguageScope.of(this);

  /// Übersetzungs-Lookup für die aktive Sprache.
  AppText get t => AppText(LanguageScope.of(this));
}
