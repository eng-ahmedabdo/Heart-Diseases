// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/helper/ai_model.dart';
import 'package:heart_diseases/view/take_atest_2_screen.dart';

import '../constant/colors.dart';
import '../custom_widget/main_button.dart';
import '../custom_widget/test_with_yes_or_no.dart';
import '../custom_widget/textfield_takeatest.dart';

class TakeATest1Screen extends StatelessWidget {
  TakeATest1Screen({super.key});

  final _cigarettesController = TextEditingController();
  AIModel aiModel = AIModel();

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
            color: blackColor,
          ),
        ),
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 15, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Healthy Heart",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Please tell us some basic information \nto complete the test ",
                        style: TextStyle(
                          color: lightBlackColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TestWithYesOrNo(
                  text: 'Do you smoke?',
                  onChanged: (value) {
                    aiModel = aiModel.copyWith(
                      isSmoking: value,
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "The average number of cigarettes you smoke in a day.",
                        style: TextStyle(color: lightBlackColor, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldTakeATest(
                        controller: _cigarettesController,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TestWithYesOrNo(
                  text: 'Are you taking blood pressure medication?',
                  onChanged: (value) {
                    aiModel = aiModel.copyWith(isHighBloodPressure: value);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: MainButton(
                      text: "Next",
                      onTap: () {
                        aiModel = aiModel.copyWith(
                          cigarettes: int.tryParse(
                            _cigarettesController.text,
                          ),
                        );
                        if (aiModel.isSmoking == null ||
                            aiModel.cigarettes == null ||
                            aiModel.isHighBloodPressure == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('That information are required'),
                            ),
                          );
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TakeATest2Screen(aiModel: aiModel),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
