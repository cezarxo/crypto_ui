import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonMenu extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double size;
  const ButtonMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.size,
  });

  @override
  State<ButtonMenu> createState() => _ButtonMenuState();
}

class _ButtonMenuState extends State<ButtonMenu> {
  bool isPressed = false;
  onPressed() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTapDown: (e) {
          onPressed();
        },
        onTapUp: (e) {
          onPressed();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: Get.width * 0.4,
          height: widget.size,
          decoration: BoxDecoration(
              color: Colors.grey,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(223, 228, 250, 1),
                  Color.fromRGBO(241, 243, 255, 1),
                  Color.fromRGBO(241, 243, 255, 1),
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.elliptical(30, 35)),
              boxShadow: !isPressed
                  ? [
                      const BoxShadow(
                          color: Color(0xffabb2ea),
                          offset: Offset(4, 4),
                          spreadRadius: 1,
                          blurRadius: 15),
                      BoxShadow(
                          color: Colors.white.withOpacity(0.9),
                          offset: const Offset(-10, -10),
                          spreadRadius: 1,
                          blurRadius: 15),
                    ]
                  : null),
          child: Center(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Icon(
                      widget.icon,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: GoogleFonts.rubik(
                        color: Get.theme.primaryColorDark,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.subtitle,
                    style: GoogleFonts.rubik(
                      color: Get.theme.primaryColorDark,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
