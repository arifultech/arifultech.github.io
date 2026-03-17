import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // responsive padding
    double horizontalPadding = 20;
    if (width > 1200) {
      horizontalPadding = 120;
    } else if (width > 800) {
      horizontalPadding = 80;
    } else if (width > 500) {
      horizontalPadding = 40;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // Title
          const Text(
            "About Me",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.3),

          const SizedBox(height: 25),

          // Full width text
          Text(
            "I am a passionate Flutter developer specializing in building modern, high-performance mobile and web applications using Flutter and Dart. I focus on creating responsive user interfaces and writing clean, scalable code to ensure smooth user experiences.\n"

             " Currently, I am working at Genuine Technology IT Company (Uttara branch), where I contribute to real-world software solutions and continuously enhance my development skills. I have completed my Bachelor's degree in Computer Science and Engineering (CSE) from Daffodil International University.\n "

      "I am based in Mohammadpur, Dhaka, originally from Pabna. My goal is to grow as a skilled software engineer and build efficient, reliable, and impactful digital products while staying updated with modern technologies.",


            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: width < 600 ? 16 : 18,
              height: 1.7,
              color: Colors.grey[300],
            ),
          )
              .animate()
              .fadeIn(delay: 300.ms)
              .slideY(begin: 0.6),
        ],
      ),
    );
  }
}