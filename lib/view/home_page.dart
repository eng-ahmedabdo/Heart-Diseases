// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/view/take_atest_1_screen.dart';

import '../constant/colors.dart';
import '../custom_widget/drawer_menu.dart';
import '../custom_widget/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        iconTheme: IconThemeData(color: Get.isDarkMode ?  whiteColor : darkModeColor , size: 30),
      ),
      drawer: drawerMenu(context),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome to Healthy Heart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/home.png"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Coronary artery disease (CAD) is one of the common diseases around the world. This necessitates a prompt and precise identification of cardiac disease. Heart disease can be managed effectively with a combination of lifestyle changes.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? whiteColor : darkModeColor,
                      fontSize: 20,
                    ),
                    strutStyle: StrutStyle(
                      fontSize: 20,
                      leading: 0.9,
                      height: 0.9,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MainButton(
                    text: "Take a Test",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  TakeATest1Screen(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
