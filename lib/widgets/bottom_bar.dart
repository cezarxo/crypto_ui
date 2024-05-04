import 'package:crypto_ui/screens/second_screen.dart';
import 'package:crypto_ui/widgets/button_circles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ButtonCircle(icon: CupertinoIcons.home),
          const ButtonCircle(icon: CupertinoIcons.creditcard),
          ButtonCircle(icon: CupertinoIcons.chart_bar, onTap: () => Get.to(()=> const ChartScreen())),
          const ButtonCircle(icon: CupertinoIcons.person_alt),
        ],
      ),
    );
  }
}
