import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heart_diseases/helper/local_storage_data.dart';
import 'package:heart_diseases/model/user_model.dart';
import 'package:heart_diseases/view/registration/login_page.dart';

class ProfileViewModel extends GetxController{

  var isLoading = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  Future<void> getCurrentUser() async {
   _userModel = await localStorageData.getUser;
    update();
  }

  Future<void> updateUser(UserModel model) async {
    await localStorageData.setUser(model);
  }

  Future<void> signOut() async{
    isLoading.value = true;
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
    Get.offAll(LoginPage());
    isLoading.value = false;
  }

}