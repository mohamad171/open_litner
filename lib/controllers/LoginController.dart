import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_litner/constants/utils.dart';

class Logincontroller extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController jwtController = TextEditingController();

  RxBool loginLoading = false.obs;
  Client client = Client();
  Account? account;
  User? user;
  RxString jwt = "".obs;
  final box = GetStorage("open_litner");
  void loginJWT(jwt){
    box.write("jwt", jwt);
    Get.offNamed("/splash");

  }

  void createJWT(){
    account!.createJWT().then((value) {
      jwt(value.jwt);
      Clipboard.setData(ClipboardData(text: value.jwt));

    },);
  }
  void checkLogin(){
  
      account!.get().then((value) {
        user = value;
        Get.offNamed("/home");



      },).onError((error, stackTrace) {
        print(error.toString());
        Get.offNamed("/login");
      },);
    

      

  }
  
  void logOut(){
    
      account!.deleteSessions();
      Get.offNamed("/login");
    

  }

  void logIn(String username, String password) {
    loginLoading(true);
    if(account != null){
      account!.createEmailPasswordSession(email: username,password: password).then((value) {
        loginLoading(false);
        Get.offNamed("/splash");
      },).onError((error, stackTrace) {
        print(error);
        showMessage("Incorrect username or password", Get.context);
        loginLoading(false);
      },);
    }
    
  }

  @override
  void onInit() {
    client.setProject('6727dd3300229057a75f');
    client.setEndpoint("https://openlitner.moderndata.ir/v1");
    account = Account(client);
    super.onInit();
  }
}
