import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const Navbar({
    super.key,
    required this.onHome,
    required this.onAbout,
    required this.onProjects,
    required this.onContact,
  });

  Widget navItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Ariful",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [
              navItem("Home", onHome),
              navItem("About", onAbout),
              navItem("Projects", onProjects),
              navItem("Contact", onContact),
            ],
          )
        ],
      ),
    );
  }
}