import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_litner/constants/utils.dart';

class Logincontroller extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool loginLoading = false.obs;
  Client client = Client();
  Account? account;
  User? user;

  void checkLogin(){
       account!.get().then((value) {
         user = value;
         Get.offNamed("/home");
       },).onError((error, stackTrace) {
         Get.offNamed("/login");
       },);
      

  }
  

  void logIn(String username, String password) {
    loginLoading(true);
    if(account != null){
      account!.createEmailPasswordSession(email: username,password: password).then((value) {
        loginLoading(false);
        Get.offNamed("/home");
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
    account = Account(client);
    super.onInit();
  }
}
