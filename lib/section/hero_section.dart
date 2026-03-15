import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {

    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
      child: isMobile ? mobileLayout() : desktopLayout(),
    );
  }

  Widget desktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Expanded(
            flex: 1,
            child: heroText()),

        Expanded(flex: 2,
          child:Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/image/pic2.jpg"),
                fit: BoxFit.scaleDown,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.4),
                  blurRadius: 30,
                  spreadRadius: 5,
                )
              ],
            ),
          )
        ),
      ],
    );
  }

  Widget mobileLayout() {
    return Column(
      children: [

        const CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/300",
          ),
        ),

        const SizedBox(height: 30),

        heroText(),
      ],
    );
  }

  Widget heroText() {
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

        const Text(
          "Ariful Islam",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [

            TypewriterAnimatedText(
              "Flutter Developer",
              textStyle: const TextStyle(
                fontSize: 28,
                color: Colors.blue,
              ),
              speed: const Duration(milliseconds: 80),
            ),

            TypewriterAnimatedText(
              "Mobile App Developer",
              textStyle: const TextStyle(
                fontSize: 28,
                color: Colors.blue,
              ),
              speed: const Duration(milliseconds: 80),
            ),

            TypewriterAnimatedText(
              "Flutter Web Developer",
              textStyle: const TextStyle(
                fontSize: 28,
                color: Colors.blue,
              ),
              speed: const Duration(milliseconds: 80),
            ),
          ],
        ),

        const SizedBox(height: 30),

        glowingButton(),

        const SizedBox(height: 30),

        socialIcons(),


        /// FLUTTER BADGE
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [

              Icon(
                Icons.flutter_dash,
                color: Colors.blue,
              ),

              SizedBox(width: 8),
              SizedBox(width: 8),
              Text(
                "Built with Flutter Web",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

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
        onPressed: () {},
        child: const Text("View Projects"),
      ),
    );
  }

  Widget socialIcons() {
    return Row(
      children: const [

        Icon(
          FontAwesomeIcons.github,
          size: 28,
        ),

        SizedBox(width: 20),

        Icon(
          FontAwesomeIcons.linkedin,
          size: 28,
        ),

        SizedBox(width: 20),

        Icon(
          FontAwesomeIcons.twitter,
          size: 28,
        ),
      ],
    );
  }
}