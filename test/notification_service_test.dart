import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:trhi_app/services/notification_service.dart';

void main() {
  test('notifyBooking sendet die Buchungsdaten an Web3Forms', () async {
    late http.Request captured;
    final mock = MockClient((req) async {
      captured = req;
      return http.Response(jsonEncode({'success': true}), 200);
    });

    await NotificationService.notifyBooking(
      firstName: 'Max',
      lastName: 'Mustermann',
      email: 'max@example.com',
      phone: '0170 1234567',
      sessionType: 'Erstgespräch',
      timeSlot: 'Mo 10:00',
      goals: const ['Abnehmen', 'Mobilität'],
      customGoal: 'Marathon',
      accessKey: 'test-key',
      client: mock,
    );

    expect(captured.method, 'POST');
    expect(captured.url.toString(), 'https://api.web3forms.com/submit');

    final body = jsonDecode(captured.body) as Map<String, dynamic>;
    expect(body['access_key'], 'test-key');
    expect(body['Name'], 'Max Mustermann');
    expect(body['E-Mail'], 'max@example.com');
    expect(body['Telefon'], '0170 1234567');
    expect(body['Session'], 'Erstgespräch');
    expect(body['Wunschtermin'], 'Mo 10:00');
    expect(body['Ziele'], 'Abnehmen, Mobilität');
    expect(body['Eigenes Ziel'], 'Marathon');
  });

  test('notifyBooking wirft bei einer Nicht-200-Antwort', () async {
    final mock = MockClient((req) async => http.Response('Bad Request', 400));

    expect(
      () => NotificationService.notifyBooking(
        firstName: 'a',
        lastName: 'b',
        email: 'c@d.e',
        sessionType: 's',
        goals: const [],
        accessKey: 'k',
        client: mock,
      ),
      throwsA(isA<Exception>()),
    );
  });

  test('notifyBooking überspringt den Versand ohne Access Key', () async {
    var called = false;
    final mock = MockClient((req) async {
      called = true;
      return http.Response('', 200);
    });

    await NotificationService.notifyBooking(
      firstName: 'a',
      lastName: 'b',
      email: 'c@d.e',
      sessionType: 's',
      goals: const [],
      accessKey: '',
      client: mock,
    );

    expect(called, isFalse);
  });
}
