import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onProjects;
  final VoidCallback onContact;
  final VoidCallback onskill;
  final VoidCallback onexperience;

  const Navbar({
    super.key,
    required this.onHome,
    required this.onskill,
    required this.onexperience,
    required this.onAbout,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(
        horizontal: width < 800 ? 20 : 60, // 🔥 responsive padding
      ),
      decoration: BoxDecoration(
        color: const Color(0xff0f172a),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// Logo
          const Text(
            "Ariful",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),

          /// Desktop Menu
          if (width > 800)
            Row(
              children: [
                _navItem("Home", onHome),
                _navItem("About", onAbout),
                _navItem("Skills", onskill),
                _navItem("Experience", onexperience),
                _navItem("Projects", onProjects),
                _navItem("Contact", onContact),
              ],
            )

          /// Mobile Menu (🔥 no structure break)
          else
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            )
        ],
      ),
    );
  }
}




class _navItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _navItem(this.title, this.onTap);

  @override
  State<_navItem> createState() => _navItemState();
}

class _navItemState extends State<_navItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isHover ? Colors.blueAccent : Colors.white70,
                ),
                child: Text(widget.title),
              ),

              const SizedBox(height: 5),

              // animated underline
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 2,
                width: isHover ? 20 : 0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }




}

