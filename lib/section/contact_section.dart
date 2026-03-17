import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/contact_item.dart';

class ContactSection extends StatelessWidget {

  const ContactSection({super.key});

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 20,
      ),

      child: Column(

        children: [

          const Text(
            "Contact",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,

            children: [

              ContactItem(
                icon:Icons.mail_outlined,
                title: "Email",
                value: "ariful.reach@gmail.com",
                onTap: () {
                  openUrl("mailto:ariful.reach@gmail.com");
                },
              ),

              ContactItem(
                icon:FontAwesomeIcons.github,
                title: "GitHub",
                value: "github.com/arifultech",
                onTap: () {
                  openUrl("https://github.com/arifultech");
                },
              ),

              ContactItem(
                icon:FontAwesomeIcons.linkedin,
                title: "LinkedIn",
                value: "linkedin.com/in/Softdev.Ariful",
                onTap: () {
                  openUrl("https://linkedin.com");
                },
              ),

              ContactItem(
                icon: Icons.phone,
                title: "Phone",
                value: "+8801784458512",
                onTap: () {
                  openUrl("Phone:+8801784458512");
                },
              ),

              ContactItem(
                icon:FontAwesomeIcons.facebook,
                title: "Facebook",
                value: "facebook.com/Vertual.Ariful",
                onTap: () {
                  openUrl("https://facebook.com");
                },
              ),

              ContactItem(
                icon:FontAwesomeIcons.instagram,
                title: "Instagram",
                value: "instagram.com/ariful",
                onTap: () {
                  openUrl("https://instagram.com");
                },
              ),

            ],
          ),

          const SizedBox(height: 60),

          /// Flutter badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  Icons.flutter_dash,
                  color: Colors.blue,
                ),

                SizedBox(width: 8),

                Text(
                  "Built with Flutter Web",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}