// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_diseases/constant/colors.dart';
import 'package:heart_diseases/custom_widget/main_button.dart';
import 'package:heart_diseases/view_model/profile_view_model.dart';
import 'package:image_picker/image_picker.dart';
import '../custom_widget/text_field_in_edit_profile.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  List<File> _images = [];

  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) {
        if (controller.userModel != null) {
          _nameController.text = controller.userModel!.name!;
          _emailController.text = controller.userModel!.email!;
        }
        return Scaffold(
          backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? darkModeColor : whiteColor,
            elevation: 0.0,
            title: Text(
              "Edit Profile",
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
                Get.back();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: Stack(
                          children: [
                            if (_images.length != 1)
                              ClipOval(
                                child: Image.asset(
                                  'assets/unpicked_image.jpg',
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (_images.length == 1)
                              ClipOval(
                                child: Image.file(
                                  _images[0],
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            Positioned(
                              bottom: 5.0,
                              right: 2.0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: tOnBoardingColor2,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: mainColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextFieldInEditProfile(
                              text: 'Name',
                              controller: _nameController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFieldInEditProfile(
                              text: 'Email',
                              controller: _emailController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            MainButton(
                              text: "Update",
                              onTap: () async {
                                Future<List<String>> _uploadImages(
                                    List<File> _selectedImagePath) async {
                                  List<String> _Images = [];
                                  for (File imageFile in _selectedImagePath) {
                                    final Reference storageReference =
                                        FirebaseStorage.instance
                                            .ref()
                                            .child('images')
                                            .child(
                                                'images/${controller.userModel!.userId}.jpg');
                                    final UploadTask uploadTask =
                                        storageReference.putFile(imageFile);
                                    final TaskSnapshot downloadUrl =
                                        (await uploadTask.whenComplete(() {}));
                                    final String url = (await downloadUrl.ref
                                        .getDownloadURL());
                                    _Images.add(url);
                                  }
                                  return _Images;
                                }

                                List<String> imageUrls =
                                    await _uploadImages(_images);
                                await FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(controller.userModel!.userId)
                                    .update({
                                  'name': _nameController.text,
                                  'email': _emailController.text,
                                  'pic': "${imageUrls[0]}",
                                }).then((value) async {
                                  await controller.updateUser(
                                      controller.userModel!.copyWith(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    pic: imageUrls,
                                  ));
                                  await controller.getCurrentUser();
                                });
                                User? user = FirebaseAuth.instance.currentUser;
                                await user!.updateEmail(_emailController.text);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            selectImageFromGallery();
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 60,
                                      color: mainColor,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectImageFromCamera();
                          },
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.camera,
                                    size: 60,
                                    color: mainColor,
                                  ),
                                  Text('Camera'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    final XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      setState(() {
        _images.add(File(file.path));
        Navigator.pop(context);
      });
    } else {
      return 'Image Not Selected';
    }
  }

  selectImageFromCamera() async {
    final XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      setState(() {
        _images.add(File(file.path));
        Navigator.pop(context);
      });
    } else {
      return 'Image Not Selected';
    }
  }
}
