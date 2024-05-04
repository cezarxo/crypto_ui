import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCircle extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const ButtonCircle({super.key, required this.icon, this.onTap});

  @override
  State<ButtonCircle> createState() => _ButtonCircleState();
}

class _ButtonCircleState extends State<ButtonCircle> {
  bool isPressed = false;
  onPressed() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTapDown: (e) {
          onPressed();
        },
        onTapUp: (e) {
          onPressed();
        },
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 60,
          height: 60,
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
              shape: BoxShape.circle,
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
                child: Icon(
                  widget.icon,
                  size: 20,
                  color: Get.theme.primaryColor,
                )),
          ),
        ),
      ),
    );
  }
}
