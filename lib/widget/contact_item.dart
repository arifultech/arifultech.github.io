import 'package:flutter/material.dart';

class ContactItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),

          // 🔥 responsive width
          width: width < 600 ? double.infinity : 190,

          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isHover
                ? Colors.white.withOpacity(.08)
                : Colors.white.withOpacity(.05),

            border: Border.all(
              color: isHover ? Colors.blueAccent : Colors.white12,
            ),

            boxShadow: [
              if (isHover)
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
            ],
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  size: 18, // 🔽 smaller
                  color: Colors.blueAccent,
                ),
              ),

              const SizedBox(width: 10),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      widget.value,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}