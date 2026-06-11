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
  final _pillarsKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _youtubeKey = GlobalKey();

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _scrollToSection(String id) {
    final key = {
      'training': _servicesKey,
      'mindbody': _pillarsKey,
      'ernaehrung': _pillarsKey,
      'youtube': _youtubeKey,
    }[id];
    final ctx = key?.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject();
    if (box is! RenderBox) return;
    // 64px Navbar liegt über dem Inhalt — Sektion knapp darunter ausrichten.
    final target = (box.localToGlobal(Offset.zero).dy + _scrollCtrl.offset - 64)
        .clamp(0.0, _scrollCtrl.position.maxScrollExtent);
    _scrollCtrl.animateTo(target,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic);
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
                ThreePillars(key: _pillarsKey),
                AboutSection(scrollController: _scrollCtrl),
                ServicesSection(key: _servicesKey),
                const BlogPreviewSection(),
                YoutubeSection(key: _youtubeKey, scrollController: _scrollCtrl),
                const FooterWidget(),
              ],
            ),
          ),
          TrhiNavBar(onSectionTap: _scrollToSection),
        ],
      ),
    );
  }
}
