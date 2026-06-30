import 'dart:convert';
import 'package:http/http.dart' as http;
import 'notify_config.dart';

/// Sendet bei einer neuen Anmeldung eine E-Mail an den Inhaber.
///
/// Nutzt Web3Forms (kostenlos, kein Server). Schlägt der Versand fehl, wirft
/// die Methode — der Aufrufer entscheidet, ob das die Buchung blockiert
/// (tut es bei uns NICHT, siehe BookingService).
class NotificationService {
  static const _endpoint = 'https://api.web3forms.com/submit';

  static Future<void> notifyBooking({
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    required String sessionType,
    String? timeSlot,
    required List<String> goals,
    String? customGoal,
    String? accessKey,
    http.Client? client,
  }) async {
    final key = accessKey ?? NotifyConfig.web3formsAccessKey;
    if (key.isEmpty) return; // nicht konfiguriert → still überspringen

    final c = client ?? http.Client();
    try {
      final res = await c.post(
        Uri.parse(_endpoint),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'access_key': key,
          'from_name': 'TRHI Website',
          'subject': 'Neue TRHI-Anmeldung: $firstName $lastName ($sessionType)',
          'Name': '$firstName $lastName',
          'E-Mail': email,
          'Telefon': phone ?? '',
          'Session': sessionType,
          'Wunschtermin': timeSlot ?? '',
          'Ziele': goals.join(', '),
          'Eigenes Ziel': customGoal ?? '',
        }),
      );
      if (res.statusCode != 200) {
        throw Exception('Web3Forms ${res.statusCode}: ${res.body}');
      }
    } finally {
      if (client == null) c.close();
    }
  }
}
