import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/constant/colors.dart';
import 'package:heart_diseases/theme/app_theme.dart';
import 'package:heart_diseases/view/healthylifestyletips_screen.dart';

import '../view/find_doctor.dart';
import '../view/my_account_screen.dart';
import '../view/take_atest_1_screen.dart';
import '../view_model/profile_view_model.dart';
import 'list_tile_in_profile_screen.dart';

Widget drawerMenu(BuildContext context) {
  return GetBuilder<ProfileViewModel>(
    init: ProfileViewModel(),
    builder: (controller) {
      if (controller.userModel == null) {
        return Center(child: CircularProgressIndicator());
      }
      return Drawer(
        backgroundColor: Get.isDarkMode ? blackColor : whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              DrawerHeader(
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/my_account_photo.png",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.userModel!.name!,
                              style: TextStyle(
                                color: Get.isDarkMode ? whiteColor : darkModeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            controller.userModel!.email!,
                            style: TextStyle(color: Get.isDarkMode ? whiteColor : darkModeColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccountScreen()),
                  );
                },
                child: ListTileInProfileScreen(
                  my_text: 'My account',
                  my_image: 'assets/myAccount_icon.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grayColor),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: grayColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.dark_mode,
                          size: 30,
                          color: smoothPinkColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Dark Mode",
                            style: TextStyle(
                              color: Get.isDarkMode ? whiteColor : darkModeColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            MyThemes().changeTheme();
                          },
                          icon: Icon(Icons.brightness_4_outlined , color: mainColor,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TakeATest1Screen(),
                    ),
                  );
                },
                child: ListTileInProfileScreen(
                  my_text: 'Prediction',
                  my_image: 'assets/prediction_icon.png',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HealthyLifeStyleTipsScreen()),
                  );
                },
                child: ListTileInProfileScreen(
                  my_text: 'Healthy Diet',
                  my_image: 'assets/healthyDiet_icon.png',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindDoctor(),
                    ),
                  );
                },
                child: ListTileInProfileScreen(
                  my_text: 'Doctors',
                  my_image: 'assets/doctor_icon.png',
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
