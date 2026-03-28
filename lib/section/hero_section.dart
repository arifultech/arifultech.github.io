import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/animated_circle.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey projectKey;

  const HeroSection({super.key, required this.projectKey});

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(

      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: isMobile ? mobileLayout(context) : desktopLayout(context),
    );
  }

  Widget desktopLayout(context) {
    return Stack(
      children: [


        /// 🔥 Main Content
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Expanded(flex: 1, child: heroText(context)),

            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  /// Glow Ring
                  Container(
                    width: 420,
                    height: 420,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                  ),

                  /// Animated Glow
                  animatedCircle(300, Colors.blue.withOpacity(0.2)),

                  /// Profile Image
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("assets/image/pic2.jpg"),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 40,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget mobileLayout(context) {
    return Column(
      children: [

        /// 🔥 Animated Profile Section
        SizedBox(
          height: 280,
          child: Stack(
            alignment: Alignment.center,
            children: [

              /// Outer Glow Ring
              Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue.withOpacity(0.2),
                    width: 2,
                  ),
                ),
              ),

              /// Animated Circle
              animatedCircle(170, Colors.blue.withOpacity(0.2)),

              /// Profile Image
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage("assets/image/pic2.jpg"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 50,
                      spreadRadius: 5,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        /// 🔥 Text Section
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: heroText(context),
        ),
      ],
    );
  }

  Widget heroText(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Hi, I'm",
          style: TextStyle(
            fontSize: 24,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 10),

         Text(
          "Ariful Islam",
          style: TextStyle(
            fontSize: isMobile?32:48,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: isMobile ? double.infinity : 380, // 🔥 responsive width
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: isMobile ? 20 : 28,
              color: Colors.blue,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  "Mobile App Developer",
                  speed: const Duration(milliseconds: 90),
                ),
                TypewriterAnimatedText(
                  "Flutter Web Developer",
                  speed: const Duration(milliseconds: 90),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        glowingButton(),

        const SizedBox(height: 30),

        socialIcons(),
      ],
    );
  }

  Widget glowingButton() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.6),
            blurRadius: 20,
            spreadRadius: 1,
          )
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 16,
          ),
        ),
        onPressed: () => scrollToSection(projectKey),
        child: const Text("View Projects"),
      ),
    );
  }

  Widget socialIcons() {
    Future<void> openUrl(String url) async {
      final Uri uri = Uri.parse(url);
      await launchUrl(uri);
    }
    return Row(
      children: [

        InkWell(
          onTap: () {
            openUrl("https://github.com/arifultech");
          },
          child: const Icon(
            FontAwesomeIcons.github,
            size: 28,
          ),
        ),

        const SizedBox(width: 30),

         InkWell(onTap: () {
           openUrl("https://linkedin.com/in/Softdev.Ariful");
         },
           child: Icon(
            FontAwesomeIcons.linkedin,
            size: 28,
                   ),
         ),

        const SizedBox(width: 20),


      ],
    );
  }
}