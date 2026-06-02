import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/ticker_banner.dart';
import '../widgets/three_pillars.dart';
import '../widgets/about_section.dart';
import '../widgets/services_section.dart';
import '../widgets/blog_preview_section.dart';
import '../widgets/youtube_section.dart';
import '../widgets/footer_widget.dart';
import '../widgets/mandala_layer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollCtrl = ScrollController();

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          const GlobalMandalaBackground(),
          SingleChildScrollView(
            controller: _scrollCtrl,
            child: Column(
              children: [
                const SizedBox(height: 64),
                HeroSection(scrollController: _scrollCtrl),
                TickerBanner(scrollController: _scrollCtrl),
                const ThreePillars(),
                AboutSection(scrollController: _scrollCtrl),
                const ServicesSection(),
                const BlogPreviewSection(),
                YoutubeSection(scrollController: _scrollCtrl),
                const FooterWidget(),
              ],
            ),
          ),
          const TrhiNavBar(),
        ],
      ),
    );
  }
}
