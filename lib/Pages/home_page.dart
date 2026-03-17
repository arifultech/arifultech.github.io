import 'package:flutter/material.dart';

import 'package:protfolio_website/widget/animated_background.dart';
import '../section/Experience_section.dart';
import '../section/Navbar.dart';
import '../section/Skill_section.dart';
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
  final skillkey = GlobalKey();
  final experiencekey = GlobalKey();

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
      // 🔥 এখানে Drawer দিবে
      endDrawer: Drawer(
        backgroundColor: const Color(0xff0f172a),
        child: Builder( // 🔥 IMPORTANT
          builder: (context) {
            return Column(
              children: [
                const SizedBox(height: 80),

                _drawerItem(context, "Home", () => scrollToSection(heroKey)),
                _drawerItem(context, "About", () => scrollToSection(aboutKey)),
                _drawerItem(context, "Skills", () => scrollToSection(skillkey)),
                _drawerItem(context, "Experience", () => scrollToSection(experiencekey)),
                _drawerItem(context, "Projects", () => scrollToSection(projectKey)),
                _drawerItem(context, "Contact", () => scrollToSection(contactKey)),
              ],
            );
          },
        ),
      ),


      body: AnimatedBackground(
        child: Stack(
          children: [
        
            /// MAIN SCROLL CONTENT
            SingleChildScrollView(
              child: Column(
                children: [
        
                  const SizedBox(height: 80), // navbar space

                  Container(
                    key: heroKey,
                    child: HeroSection(projectKey: projectKey),
                  ),
                  Container(key: aboutKey, child: const AboutSection()),
                  Container(key: skillkey, child: const SkillsSection()),
                  Container(key: experiencekey, child: const ExperienceSection()),
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
                onskill: () => scrollToSection(skillkey),
                onexperience: () => scrollToSection(experiencekey),
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
  Widget _drawerItem(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        Navigator.pop(context); // close drawer
        onTap(); // trigger scroll
      },
    );
  }
}