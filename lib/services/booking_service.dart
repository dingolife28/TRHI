import 'package:cloud_firestore/cloud_firestore.dart';

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
  }) =>
      _db.collection('bookings').add({
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
}
