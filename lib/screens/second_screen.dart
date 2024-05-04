import 'package:crypto_ui/widgets/button_circles.dart';
import 'package:crypto_ui/widgets/card_chart.dart';
import 'package:crypto_ui/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const CardChart(),
          Text(
            'Sales Revenues',
            style: TextStyle(
                color: Get.theme.primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Column(
            children: mockData
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListTile(
                      leading: ButtonCircle(icon: e['icon']),
                      title: Text(
                        e['title'],
                        style: TextStyle(
                            color: Get.theme.primaryColorDark,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        e['subtitle'],
                        style: TextStyle(
                          color: Get.theme.primaryColorDark,
                        ),
                      ),
                      trailing: Text(
                        e['trailing'],
                        style: GoogleFonts.rubik(
                            color: Get.theme.primaryColorDark,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

const List<Map<String, dynamic>> mockData = [
  {
    'title': 'Sales',
    'subtitle': 'Since last week',
    'trailing': '230k',
    'icon': CupertinoIcons.bitcoin_circle,
  },
  {
    'title': 'Customers',
    'subtitle': 'Since last week',
    'trailing': "8.549k",
    'icon': CupertinoIcons.person_alt_circle,
  },
  {
    'title': 'Products',
    'subtitle': 'Since last week',
    'trailing': '1.423k',
    'icon': CupertinoIcons.money_dollar_circle,
  },
  {
    'title': 'Revenue',
    'subtitle': 'Since last week',
    'trailing': '\$9745k',
    'icon': CupertinoIcons.chart_pie,
  },
];
