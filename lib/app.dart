import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/booking_screen.dart';
import 'blog/blog_index_screen.dart';
import 'blog/blog_article_screen.dart';

final _router = GoRouter(
  routes: [
    GoRoute(path: '/',        builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/booking', builder: (context, state) => const BookingScreen()),
    GoRoute(path: '/blog',    builder: (context, state) => const BlogIndexScreen()),
    GoRoute(
      path: '/blog/:slug',
      builder: (context, state) =>
          BlogArticleScreen(slug: state.pathParameters['slug']!),
    ),
  ],
);

class TrhiApp extends StatelessWidget {
  const TrhiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TRHI — The Real Health Insurance',
      theme: buildAppTheme(),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
