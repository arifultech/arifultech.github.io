import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/projectModel.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  void openUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(project.title),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 30,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TITLE
            Text(
              project.title,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// DESCRIPTION
            Text(
              project.description,
              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            /// MAIN IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(project.image,
                // project.image,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 40),

            /// FEATURES
            const Text(
              "Features",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: project.features.map((feature) {

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [

                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: Colors.green,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        feature,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                );

              }).toList(),
            ),

            const SizedBox(height: 40),

            /// TECH STACK
            const Text(
              "Tech Stack",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: project.techStack.map((tech) {

                return Chip(
                  label: Text(tech),
                );

              }).toList(),
            ),

            const SizedBox(height: 40),

            /// BUTTONS
            Row(
              children: [

                ElevatedButton.icon(
                  onPressed: () {
                    openUrl(project.videoUrl);
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Watch Demo"),
                ),

                const SizedBox(width: 20),

                OutlinedButton.icon(
                  onPressed: () {
                    openUrl(project.githubUrl);
                  },
                  icon: const Icon(Icons.code),
                  label: const Text("GitHub"),
                ),
              ],
            ),

            const SizedBox(height: 50),

            /// SCREENSHOTS
            const Text(
              "Screenshots",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: project.screenshots.map((img) {

                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    img,
                    width: 250,
                    height: 400,
                    fit: BoxFit.fitHeight,
                  ),
                );

              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}