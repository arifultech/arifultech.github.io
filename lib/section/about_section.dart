import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [

          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),

          const SizedBox(height: 20),

          SizedBox(
            width: 700,
            child: Text(
              "I am a passionate Flutter developer who builds modern mobile and web applications using Flutter and Dart. I enjoy creating responsive user interfaces and writing clean, scalable code that delivers smooth user experiences. "
                  "I focus on building high-performance applications, integrating REST APIs, and following modern development practices to create reliable products. "
                  "I am constantly learning new technologies and improving my development skills to build better and more efficient software solutions.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
                height: 1.6,
                color: Colors.grey[300],
              ),
            ),
          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.7),

        ],
      ),
    );
  }
}