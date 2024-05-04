import 'package:crypto_ui/widgets/bottom_bar.dart';
import 'package:crypto_ui/widgets/button_menu.dart';
import 'package:crypto_ui/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              ListTile(
                title: Text(
                  'Hello Aziz',
                  style: TextStyle(
                    color: Get.theme.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.settings,
                    color: Get.theme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ButtonMenu(
                          icon: CupertinoIcons.bitcoin_circle,
                          title: '215k',
                          subtitle: 'Sales',
                          size: 190,
                        ),
                        ButtonMenu(
                          icon: CupertinoIcons.money_dollar_circle,
                          title: '415k',
                          subtitle: 'Products',
                          size: 225,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ButtonMenu(
                          icon: CupertinoIcons.person_alt_circle,
                          title: '9.509k',
                          subtitle: 'Customers',
                          size: 210,
                        ),
                        ButtonMenu(
                          icon: CupertinoIcons.chart_pie,
                          title: '\$9745',
                          subtitle: 'Revenue',
                          size: 190,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
