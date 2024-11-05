// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_litner/controllers/HomeController.dart';
import 'package:open_litner/controllers/LoginController.dart';
import 'package:open_litner/widgets/box_widget.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  void init(){
    controller.getBoxWordsCount(-1);
    controller.getBoxWordsCount(0);
    controller.getBoxWordsCount(1);
    controller.getBoxWordsCount(2);
    controller.getBoxWordsCount(3);
    controller.getBoxWordsCount(4);

  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration.zero,(){
        init();
    });
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){
          Get.find<Logincontroller>().logOut();

      },
      child: Icon(Icons.exit_to_app,color: Colors.white,),
      ),
      body: Obx(() => Column(
        children: [
          SizedBox(
            height: 75,
          ),
          Row(children: [
            ElevatedButton(onPressed: (){
              init();

            }, child: Icon(Icons.refresh))
          ],),
          
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/words",arguments: {"box":0});
                  },
                  child: BoxWidget(
                    title: 'Home 1',
                    wordsCount: controller.box0.value,
                    bgColor: Colors.blue.shade500,
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed("/words",arguments: {"box":1});
                },
                child: BoxWidget(
                    title: 'Home 2',
                    wordsCount: controller.box1.value,
                    bgColor: Colors.blue.shade600),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed("/words",arguments: {"box":2});
                },
                child: BoxWidget(
                    title: 'Home 3',
                    wordsCount: controller.box2.value,
                    bgColor: Colors.blue.shade700),
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed("/words",arguments: {"box":3});
                },
                child: BoxWidget(
                    title: 'Home 4',
                    wordsCount: controller.box3.value,
                    bgColor: Colors.blue.shade800),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed("/words",arguments: {"box":4});
                },
                child: BoxWidget(
                    title: 'Home 5',
                    wordsCount:controller.box4.value,
                    bgColor: Colors.blue.shade900),
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: BoxWidget(
                title: 'Archive',
                wordsCount: controller.archive.value,
                bgColor: Colors.green,
              )),
            ],
          ),
        ],
      ),),
    ));
  }
}
