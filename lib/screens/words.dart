// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_litner/constants/utils.dart';
import 'package:open_litner/controllers/WordController.dart';

import '../widgets/word_widget.dart';

class WordsScreen extends GetView<Wordcontroller> {
  WordsScreen({super.key});

  void init() {
    controller.getBoxWords(Get.arguments["box"]);
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration.zero, () {
      init();
    });
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.blueAccent,
        backgroundColor: Colors.blue,
        onPressed: () {
          // TODO: Should add new Record dialog
        },
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Home ${Get.arguments['box'] + 1}",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 12,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              )
            ],
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Obx(() => Expanded(
              child: ListView.builder(
            itemCount: controller.listOfWords.length,
            itemBuilder: (context, index) {
              var item = controller.listOfWords[index];

              return Dismissible(
                key: Key(item.$id),
                background: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  color: Colors.green,
                ),
                secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    color: Colors.red),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    // TODO Move word to next home
                    showMessage("Ok, Word moved to next home", context);
                  } else {
                    showMessage(
                        'Oh! Sorry, Word moved to first home.', context);
                  }
                  return false;
                },
                child: WordWidget(title:item.data["title"]),
                direction: DismissDirection.horizontal,
              );
            },
          ),
          ),)
        ],
      ),
    ));
  }
}
