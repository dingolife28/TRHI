import 'package:flutter/widgets.dart';
import 'package:trhi_app/i18n/app_lang.dart';
import 'package:trhi_app/i18n/language_controller.dart';
import 'package:trhi_app/i18n/language_scope.dart';

/// Wickelt einen Widget-Baum in einen [LanguageScope], damit Screens, die
/// `context.t` / `context.lang` nutzen, im Test eine Sprache finden.
Widget withLang(Widget child, {AppLang lang = AppLang.de}) =>
    LanguageScope(controller: LanguageController(lang), child: child);
