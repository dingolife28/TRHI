import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';
import 'i18n/language_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Datumsformate für beide Sprachen vorbereiten.
  await initializeDateFormatting('de');
  await initializeDateFormatting('en');
  // Gespeicherte Sprachwahl laden (Default: Deutsch).
  final language = await LanguageController.load();
  // Firebase-Init abgesichert: schlägt sie fehl (z. B. eingeschränkter API-Key
  // auf Mobile), startet die App trotzdem — nur die Buchung wäre dann offline,
  // statt dass der ganze Screen weiß bleibt.
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e, st) {
    debugPrint('Firebase-Init fehlgeschlagen: $e\n$st');
  }
  runApp(TrhiApp(language: language));
}
