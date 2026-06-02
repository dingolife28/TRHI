import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/booking_left.dart';
import '../widgets/booking_form.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _selectedSession = 3;
  String? _selectedSlot;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.tablet;

    final left = BookingLeft(
      selectedSession: _selectedSession,
      selectedSlot: _selectedSlot,
      onSessionChanged: (i) => setState(() => _selectedSession = i),
      onSlotChanged: (s) => setState(() => _selectedSlot = s),
    );

    final form = BookingForm(
      sessionType: _sessionLabel(_selectedSession),
      timeSlot: _selectedSlot,
    );

    if (isMobile) {
      return Scaffold(
        backgroundColor: AppColors.canvasDark,
        body: SingleChildScrollView(
          child: Column(children: [left, form]),
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.canvasDark,
              child: SingleChildScrollView(child: left),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.canvasLight,
              child: SingleChildScrollView(child: form),
            ),
          ),
        ],
      ),
    );
  }

  String _sessionLabel(int i) => const [
    '1:1 Personal Training',
    'Health Consulting',
    'Mind-Body Session',
    'Erstgespräch',
  ][i];
}
