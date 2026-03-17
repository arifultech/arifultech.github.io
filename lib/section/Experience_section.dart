import 'package:flutter/material.dart';
import '../data/experience_data.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Experience",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),

          ...List.generate(experiences.length, (index) {
            final exp = experiences[index];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline Line + Dot
                Column(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (index != experiences.length - 1)
                      Container(
                        width: 2,
                        height: 180,
                        color: Colors.white24,
                      ),
                  ],
                ),

                const SizedBox(width: 20),

                // Card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Company + Duration
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                exp.company,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              exp.duration,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // Points
                        ...exp.points.map(
                              (point) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("• ",
                                    style: TextStyle(color: Colors.blueAccent)),
                                Expanded(
                                  child: Text(
                                    point,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}