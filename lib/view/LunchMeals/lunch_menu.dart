import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/colors.dart';
import '../BreakfastMeals/breakfast_menu.dart';
import '../DinnerMeals/dinner_menu.dart';

class LunchMenu extends StatelessWidget {
  const LunchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Check today`s menu',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: TextButton(
                          child: Text(
                            'Breakfast',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BreakfastMenu(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Color(0xff4A5B64),
                              //elevation: 2,
                              backgroundColor: Color(0xffDBDBDB)),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: TextButton(
                          child: Text(
                            'Lunch',
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LunchMenu(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            //elevation: 2,
                            backgroundColor: mainColor,
                          ),

                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: TextButton(
                          child: Text(
                            'Dinner',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DinnerMenu(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Color(0xff4A5B64),
                              //elevation: 2,
                              backgroundColor: Color(0xffDBDBDB)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/breakfastMeal1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Oats with yogurt',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '5 Min',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffC4C4C4)),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/breakfastMeal2.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Eggs with vegetables',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '5 Min',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffC4C4C4),
                                    letterSpacing: 0.60),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/breakfastMeal3.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Toast with cheese',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 0.72),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '5 Min',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffC4C4C4),
                                  fontFamily: "IBM Plex Sans",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.60,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/breakfastMeal4.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Omelet eggs',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 0.72),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '5 Min',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffC4C4C4),
                                  fontFamily: "IBM Plex Sans",
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.60,
                                ),
                              )
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       height: 120,
                          //       width: 150,
                          //       decoration: BoxDecoration(
                          //         image: const DecorationImage(
                          //           image:
                          //               AssetImage('assets/breakfastMeal4.png'),
                          //           fit: BoxFit.fill,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //     Text(
                          //       'Omelet eggs',
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 16,
                          //         fontFamily: "IBM Plex Sans",
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //     Text(
                          //       '5 Min',
                          //       style: TextStyle(
                          //         fontSize: 15,
                          //         color: Color(0xffC4C4C4),
                          //         fontFamily: "IBM Plex Sans",
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}