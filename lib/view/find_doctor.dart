// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/custom_widget/doctor_item.dart';
import 'package:heart_diseases/helper/doctor_data.dart';
import 'package:heart_diseases/model/doctor_model.dart';

import '../constant/colors.dart';

class FindDoctor extends StatefulWidget {
  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  List<DoctorModel> doctors = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    doctors = getDoctors();
    setState(() {
      _loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
        elevation: 0.0,
        title: Text(
          "Doctors",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Get.isDarkMode ? whiteColor : darkModeColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Get.isDarkMode ? whiteColor : darkModeColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: doctors.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return DoctorItem(
              name: doctors[index].name,
              imageUrl: doctors[index].imageUrl,
              address: doctors[index].address,
              specialize: doctors[index].Specialization,
            );
          },
        ),
      ),
    );
  }
}
