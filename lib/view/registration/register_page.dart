import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/constant/colors.dart';
import 'package:heart_diseases/view/registration/auth.dart';
import 'package:heart_diseases/view/registration/signup_page.dart';

import 'login_page.dart';

class RegisterPage extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Container(
                height: size.height * 0.3,
                width: size.width * 0.6,
                child: Image(
                  image: AssetImage('assets/splash.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Are you prepared to start \nyour journey with us?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: (){
               Get.to(() => SignUpPage());
              },
              child: Padding(
                padding: EdgeInsets.only(left: 40 , right: 40 , top: 30),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => LoginPage());
              },
              child: Padding(
                padding: EdgeInsets.only(left: 40 , right: 40 , top: 25),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: mainColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
