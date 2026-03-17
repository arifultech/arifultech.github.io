import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/skill_model.dart';

class SkillGrid extends StatelessWidget {
  final List<Skill> skills;

  const SkillGrid({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;
    if (width < 1000) crossAxisCount = 3;
    if (width < 700) crossAxisCount = 2;

   return  GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300, // 🔥 card max width
        crossAxisSpacing: 6,
        mainAxisSpacing: 8,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final skill = skills[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _SkillCard(skill: skill),
        );
      },
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Skill skill;

  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered
            ? (Matrix4.identity()..translate(0, -5))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered ? Colors.grey[850] : Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered ? Colors.blueAccent : Colors.white12,
          ),
          boxShadow: isHovered
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row (Icon + Name)
            Row(
              children: [
                SvgPicture.asset(
                  widget.skill.icon,
                  width: 16,
                  height: 16,
                  placeholderBuilder: (_) =>
                  const Icon(Icons.code, size: 16, color: Colors.white),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.skill.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Progress Bar with animation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: widget.skill.level),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, _) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: value,
                        minHeight: 6,
                        backgroundColor: Colors.white12,
                        valueColor:
                        const AlwaysStoppedAnimation(Colors.blueAccent),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 4),

                // 🔥 TEXT (7/10 style)
                Text(
                  "${(widget.skill.level * 10).toInt()}/10",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}