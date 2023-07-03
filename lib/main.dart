import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heart_diseases/helper/binding.dart';
import 'package:heart_diseases/helper/control_view.dart';
import 'package:heart_diseases/theme/app_theme.dart';

void main() async {
  //This two lines to connect the app with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'Heart Diseases',
      theme: MyThemes().lightTheme,
      darkTheme: MyThemes().darkTheme,
      themeMode: MyThemes().getThemeMode(),
      home: ControlView(),
    );
  }
}
