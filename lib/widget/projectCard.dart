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
    double width = MediaQuery.of(context).size.width;

    bool isMobile = width < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        // ❌ width REMOVE করা হয়েছে (Grid handle করবে)

        transform: Matrix4.identity()
          ..scale(isHover ? 1.04 : 1.0),

        child: GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔥 Image (mobile ছোট)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.image,
                  height: isMobile ? 80 : 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: isMobile ? 5 : 9),

              // 🔥 Title
              Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14, // 🔽 mobile smaller
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: isMobile ? 4 : 4),

              // 🔥 Description
              Text(
                widget.description,
                maxLines: isMobile ? 1 : 2, // 🔥 mobile 1 line only
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isMobile ? 11 : 11,
                  color: Colors.grey[400],
                ),
              ),

              SizedBox(height: isMobile ? 6 : 10),

              // 🔥 Action Row (mobile compact)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "View",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: isMobile ? 11 : 13,
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward_ios,
                    size: isMobile ? 10 : 12,
                    color: Colors.blueAccent,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}