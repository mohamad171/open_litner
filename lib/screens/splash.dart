import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:open_litner/controllers/LoginController.dart';

class SplashScreen extends GetView<Logincontroller> {
  @override
  Widget build(BuildContext context) {
    new Timer(Duration.zero, (){
        controller.checkLogin();
    });
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color to blue
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Text(
                'Welcome', // Optional welcome text or logo in the center
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 50, // Position indicator at bottom center
              left: 0,
              right: 0,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white, // Set indicator color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}