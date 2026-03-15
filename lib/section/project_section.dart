import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widget/projectCard.dart';


class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [

          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn().slideY(begin: 3),

          const SizedBox(height: 40),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            children: [

              const ProjectCard(
                title: "Chat App",
                description: "Realtime chat application",
                image:
                "https://cdn-icons-png.flaticon.com/512/9068/9068672.png",
              ).animate().fadeIn(delay: 200.ms).scale(),
              SizedBox(width: 10,),
              const ProjectCard(
                title: "Ecommerce",
                description: "Online shopping application",
                image:
                "https://cdn-icons-png.flaticon.com/512/3144/3144456.png",
              ).animate().fadeIn(delay: 400.ms).scale(),


              const ProjectCard(
                title: "Ecommerce",
                description: "Online shopping application",
                image:
                "https://cdn-icons-png.flaticon.com/512/3144/3144456.png",
              ).animate().fadeIn(delay: 400.ms).scale(),


              const ProjectCard(
                title: "Ecommerce",
                description: "Online shopping application",
                image:
                "https://cdn-icons-png.flaticon.com/512/3144/3144456.png",
              ).animate().fadeIn(delay: 400.ms).scale(),


              const ProjectCard(
                title: "Ecommerce",
                description: "Online shopping application",
                image:
                "https://cdn-icons-png.flaticon.com/512/3144/3144456.png",
              ).animate().fadeIn(delay: 400.ms).scale(),

            ],
          )
        ],
      ),
    );
  }
}