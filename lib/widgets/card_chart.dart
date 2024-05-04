import 'package:crypto_ui/widgets/simple_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardChart extends StatefulWidget {
  const CardChart({super.key});

  @override
  State<CardChart> createState() => _CardChartState();
}

class _CardChartState extends State<CardChart> {
  String? val = '1W';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: Get.width,
        height: 250,
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
            boxShadow: [
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
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: mockData
                    .map((e) => Column(
                          children: [
                            Text(
                              e['title'],
                              style: GoogleFonts.rubik(
                                  color: e['color'],
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                e['subtitle'],
                                style:
                                    TextStyle(color: e['color'], fontSize: 12),
                              ),
                            ),
                          ],
                        ))
                    .toList()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 150,
                child: MyLineChart(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: ['10', '1W', '1M', '3M', '6M', '9M', '1Y']
                    .map(
                      (e) => SizedBox(
                        height: 30,
                        width: 40,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              val = e;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                val == e ? Get.theme.primaryColor : null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 11.0,
                            ),
                          ),
                          child: Text(
                            e,
                            style: TextStyle(
                              color:
                                  val == e ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> mockData = [
  {
    'title': "\$54.732.97",
    'subtitle': 'Global Avg.',
    'color': Get.theme.primaryColorDark,
  },
  {
    'title': '\$ 80.3M',
    'subtitle': 'Market Cap.',
    'color': Colors.greenAccent.shade700,
  },
  {
    'title': '\$ 1.73M',
    'subtitle': 'Volume',
    'color': Colors.orangeAccent.shade700,
  }
];
