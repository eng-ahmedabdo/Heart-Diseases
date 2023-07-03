import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/view/home_page.dart';
import 'package:heart_diseases/view/onboarding/onboarding_page.dart';
import 'package:heart_diseases/view/registration/auth.dart';

class ControlView extends GetWidget<AuthViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: unnecessary_null_comparison
      return (Get.find<AuthViewModel>().user == null)
          ? OnboardingPage()
          : HomeScreen();
    });
  }
}
