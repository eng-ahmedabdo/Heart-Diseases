
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/constant/colors.dart';

class BreakFastMeal2 extends StatelessWidget {
  String txt = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: Container(
          color: Get.isDarkMode ? darkModeColor : whiteColor,
          child: Column(
            children: [
              Container(
                height: 340,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: AssetImage('assets/breakfastMeal2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 61,
                width: double.infinity,
                color: Color(0xffE97777),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Eggs with vegetables',
                    style: TextStyle(
                      fontFamily: "IBM Plex Sans",
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(
                        fontSize: 24,
                        color: Get.isDarkMode ? whiteColor : Colors.black,
                        fontFamily: "IBM Plex Sans",
                        fontWeight: FontWeight.w600
                        // fontWeight: FontWeight.w500,
                        //   letterSpacing: 0.60,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Ingredients('Whole loaf'),
              SizedBox(
                height: 10,
              ),
              Ingredients('whole egg'),
              SizedBox(
                height: 10,
              ),
              Ingredients('Boiled egg white'),
              SizedBox(
                height: 10,
              ),
              Ingredients('Vegetable dish'),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Color(0xffDBDBDB),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/cup.png'),
                    backgroundColor: Color(0xffF5F5F5),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'A cup of green tea an hour after the meal',
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.60,
                        height: 1.5,
                        fontSize: 18,
                        color: Get.isDarkMode ? whiteColor : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Ingredients(String txt) {
  return Container(
    child: Row(
      children: [
        SizedBox(
          width: 28,
        ),
        Icon(
          Icons.circle,
          size: 7,
          color: Get.isDarkMode ? whiteColor : Colors.black,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          txt,
          style: TextStyle(
            color: Get.isDarkMode ? whiteColor : Colors.black,
            fontSize: 18,
            fontFamily: "IBM Plex Sans",
          ),
        )
      ],
    ),
  );
}
