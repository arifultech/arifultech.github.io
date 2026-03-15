import 'package:flutter/material.dart';
import 'package:protfolio_website/widget/animated_background.dart';
import '../section/Navbar.dart';
import '../section/about_section.dart';
import '../section/contact_section.dart';
import '../section/hero_section.dart';
import '../section/project_section.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: Stack(
          children: [
        
            /// MAIN SCROLL CONTENT
            SingleChildScrollView(
              child: Column(
                children: [
        
                  const SizedBox(height: 80), // navbar space
        
                  Container(key: heroKey, child: const HeroSection()),
                  Container(key: aboutKey, child: const AboutSection()),
                  Container(key: projectKey, child: const ProjectsSection()),
                  Container(key: contactKey, child: const ContactSection()),
        
                ],
              ),
            ),
        
            /// FIXED NAVBAR
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Navbar(
                onHome: () => scrollToSection(heroKey),
                onAbout: () => scrollToSection(aboutKey),
                onProjects: () => scrollToSection(projectKey),
                onContact: () => scrollToSection(contactKey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}