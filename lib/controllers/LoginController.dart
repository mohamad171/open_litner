


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    RxBool loginLoading = false.obs;

  void logIn(String username, String password) {
    print("${username} ----- ${password}");
    
  }

  

}
