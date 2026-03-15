import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [

          const Text(
            "Contact",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IconButton(
                icon: const Icon(Icons.email, size: 30),
                onPressed: () {},
              ),

              const SizedBox(width: 20),

              IconButton(
                icon: const Icon(Icons.code, size: 30),
                onPressed: () {},
              ),

              const SizedBox(width: 20),

              IconButton(
                icon: const Icon(Icons.work, size: 30),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}