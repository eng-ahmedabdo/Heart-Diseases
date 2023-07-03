// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/view/home_page.dart';

import '../constant/colors.dart';
import '../custom_widget/main_button.dart';

class HaveNoRiskScreen extends StatelessWidget {
  const HaveNoRiskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color:  Get.isDarkMode ? whiteColor : darkModeColor,
          ),
        ),
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "You have no risk of coronary heart disease CHD",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Get.isDarkMode ? whiteColor : darkModeColor,
                    fontSize: 23,
                    fontWeight: FontWeight.w600,),
                strutStyle: StrutStyle(
                  leading: 1.5,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Image.asset("assets/norisk.png"),
              SizedBox(
                height: 35,
              ),
              Text(
                "You are very healthy. \nTake care of your health because \nit is the most important",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Get.isDarkMode ? whiteColor : darkModeColor,
                  fontSize: 20,
                ),
                strutStyle: StrutStyle(
                  leading: 1.5,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                text: "GO Home",
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
