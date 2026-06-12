import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_lang.dart';

/// Der EINE Schalter. Genau eine Instanz lebt an der App-Wurzel; jedes Widget,
/// das Text zeigt, hört über [LanguageScope] darauf. Ein [toggle] rebuildet
/// damit die gesamte sichtbare UI auf einen Schlag.
class LanguageController extends ChangeNotifier {
  LanguageController(this._lang, [this._prefs]);

  AppLang _lang;
  final SharedPreferences? _prefs;
  static const _prefsKey = 'app_lang';

  AppLang get lang => _lang;

  void set(AppLang lang) {
    if (lang == _lang) return;
    _lang = lang;
    _prefs?.setString(_prefsKey, lang.code);
    notifyListeners();
  }

  void toggle() => set(_lang == AppLang.de ? AppLang.en : AppLang.de);

  /// Lädt die gespeicherte Sprachwahl (Default: Deutsch). Schlägt das Laden
  /// fehl, startet die App trotzdem auf Deutsch.
  static Future<LanguageController> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getString(_prefsKey);
      return LanguageController(saved == 'en' ? AppLang.en : AppLang.de, prefs);
    } catch (_) {
      return LanguageController(AppLang.de);
    }
  }
}
