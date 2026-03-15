import 'package:flutter/material.dart';
import 'glass_card.dart';

class ProjectCard extends StatefulWidget {

  final String title;
  final String description;
  final String image;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(

      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },

      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..scale(isHover ? 1.05 : 1.0),

        child: GlassCard(
          child: Column(
            children: [

              Image.network(widget.image, height: 120),

              const SizedBox(height: 15),

              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(widget.description),

            ],
          ),
        ),
      ),
    );
  }
}