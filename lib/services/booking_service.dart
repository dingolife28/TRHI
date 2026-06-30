import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'notification_service.dart';

class BookingService {
  static final _db = FirebaseFirestore.instance;

  static Future<void> submit({
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    required String sessionType,
    String? timeSlot,
    required List<String> goals,
    String? customGoal,
    int? age,
    int? height,
    int? weight,
    String? injuries,
    String? activityLevel,
    String? source,
    http.Client? client,
  }) async {
    await _db.collection('bookings').add({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone ?? '',
      'sessionType': sessionType,
      'timeSlot': timeSlot ?? '',
      'goals': goals,
      'customGoal': customGoal ?? '',
      'age': age,
      'height': height,
      'weight': weight,
      'injuries': injuries ?? '',
      'activityLevel': activityLevel ?? '',
      'source': source ?? '',
      'status': 'new',
      'createdAt': FieldValue.serverTimestamp(),
    });

    // E-Mail-Benachrichtigung an den Inhaber. Ein Fehler hier darf die bereits
    // gespeicherte Buchung NICHT als Fehler erscheinen lassen.
    try {
      await NotificationService.notifyBooking(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        sessionType: sessionType,
        timeSlot: timeSlot,
        goals: goals,
        customGoal: customGoal,
        client: client,
      );
    } catch (_) {
      // bewusst geschluckt: Buchung liegt in Firestore, nur die Mail schlug fehl
    }
  }
}
