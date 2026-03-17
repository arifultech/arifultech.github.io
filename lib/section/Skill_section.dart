import 'package:flutter/material.dart';
import '../data/Skill_data.dart';

import '../widget/Skill.dart';
import '../widget/skill_grid.dart';


class SkillsSection extends StatelessWidget {

  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        vertical: 80,
      ),

      child: Column(

        children: [

          const Text(
            "Skills",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Mobile Development",style: TextStyle(fontSize: 30,),)),
              SkillGrid(skills: mobileSkills),

              SizedBox(height: 40),
              Center(child: Text("Mobile Features",style: TextStyle(fontSize: 30,),)),
              SkillGrid(skills: Features),

              SizedBox(height: 40),
              Center(child: Text("Advanced",style: TextStyle(fontSize: 30,),)),
              SkillGrid(skills: Advance),


              SizedBox(height: 40),

              Center(child: Text("Backend",style: TextStyle(fontSize: 30,),)),
              SkillGrid(skills: backendSkills),

              SizedBox(height: 40),

              Center(child: Text("Tools",style: TextStyle(fontSize: 30,),)),
              SkillGrid(skills: toolsSkills),
            ],
          )

        ],
      ),
    );
  }
}