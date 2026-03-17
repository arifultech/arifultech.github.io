import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Pages/ProjectDetailsPage.dart';
import '../data/Project_data.dart';
import '../widget/projectCard.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [

          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn().slideY(begin: 3),

          const SizedBox(height: 30),

          LayoutBuilder(
            builder: (context, constraints) {

              int crossAxisCount;

              if (constraints.maxWidth < 600) {
                crossAxisCount = 2; // 📱 mobile
              } else if (constraints.maxWidth < 1000) {
                crossAxisCount = 3; // 💻 tablet
              } else {
                crossAxisCount = 5; // 🖥 desktop
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // 🔥 card height control
                  childAspectRatio:
                  constraints.maxWidth < 600 ? 1.1 : 1,
                ),

                itemBuilder: (context, index) {
                  final project = projects[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProjectDetailsPage(project: project),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProjectCard(
                        title: project.title,
                        description: project.description,
                        image: project.image,
                      ).animate().fadeIn().scale(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}