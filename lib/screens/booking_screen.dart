import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../theme/app_text_styles.dart';
import '../i18n/app_text.dart';
import '../i18n/language_scope.dart';
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

  // Alle Wege hierher nutzen context.go() — der Navigator-Stack ist dann leer
  // und BackButton/maybePop täte nichts. Darum: pop wenn möglich, sonst Home.
  void _goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.tablet;

    final left = BookingLeft(
      selectedSession: _selectedSession,
      selectedSlot: _selectedSlot,
      onSessionChanged: (i) => setState(() => _selectedSession = i),
      onSlotChanged: (s) => setState(() => _selectedSlot = s),
    );

    final form = BookingForm(
      sessionType: _sessionLabel(t, _selectedSession),
      timeSlot: _selectedSlot,
    );

    if (isMobile) {
      return Scaffold(
        backgroundColor: AppColors.canvasDark,
        appBar: AppBar(
          backgroundColor: AppColors.canvasDark,
          elevation: 0,
          leading: BackButton(
            color: AppColors.onDark,
            onPressed: () => _goBack(context),
          ),
          title: Text(t.bookingScreenTitle,
              style: AppTextStyles.headingSM.copyWith(color: AppColors.onDark)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Divider(color: AppColors.hairlineDark, height: 1),
          ),
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(children: [left, form]),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Row(
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
          Positioned(
            top: AppSpacing.xl,
            left: AppSpacing.xl,
            child: IconButton(
              onPressed: () => _goBack(context),
              icon: const Icon(Icons.arrow_back),
              color: AppColors.onDark,
              tooltip: t.back,
            ),
          ),
        ],
      ),
    );
  }

  String _sessionLabel(AppText t, int i) => [
    t.session1Title,
    t.session2Title,
    t.session3Title,
    t.session4Title,
  ][i];
}
