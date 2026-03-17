import 'package:flutter/material.dart';
import '../model/skill_model.dart';

class SkillCard extends StatelessWidget {

  final Skill skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 200,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.05),
        border: Border.all(color: Colors.white12),
      ),

      child: Column(
        children: [

          Image.network(
            skill.icon,
            height: 50,
          ),

          const SizedBox(height: 10),

          Text(
            skill.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          LinearProgressIndicator(
            value: skill.level,
            minHeight: 6,
            borderRadius: BorderRadius.circular(20),
          ),
        ],
      ),
    );
  }
}