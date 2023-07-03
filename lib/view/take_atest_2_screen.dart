// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/helper/ai_model.dart';
import 'package:heart_diseases/view/bmi_calculator.dart';

import '../constant/colors.dart';
import '../custom_widget/main_button.dart';
import '../custom_widget/test_with_yes_or_no.dart';
import '../custom_widget/textfield_takeatest.dart';

class TakeATest2Screen extends StatelessWidget {
  TakeATest2Screen({super.key, required this.aiModel}) : model = aiModel;

  final AIModel aiModel;

  AIModel model;
  final _cholesterolController = TextEditingController();

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
            color: Get.isDarkMode ? whiteColor : darkModeColor,
          ),
        ),
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TestWithYesOrNo(
                text: "Have you ever had a stroke or not?",
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              TestWithYesOrNo(
                text: "Do you suffer from high blood pressure or not?",
                onChanged: (value) {
                  model = model.copyWith(bloodPressureMedTreatment: value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TestWithYesOrNo(
                text: "Do you suffer from diabetes or not ?",
                onChanged: (value) {
                  model = model.copyWith(isDiabetes: value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  "Total cholesterol level",
                  style: TextStyle(
                    color: lightBlackColor,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFieldTakeATest(
                  controller: _cholesterolController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: MainButton(
                  text: "Next",
                  onTap: (() {
                    model = model.copyWith(
                      totalCholesterol:
                          double.tryParse(_cholesterolController.text),
                    );

                    if (model.isDiabetes == null ||
                        model.bloodPressureMedTreatment == null ||
                        model.totalCholesterol == null) {
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
                        builder: (context) => BMIPage(aiModel: model),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
