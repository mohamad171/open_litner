// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_litner/widgets/box_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/words");
                  },
                  child: BoxWidget(
                    title: 'Home 1',
                    wordsCount: 87,
                    bgColor: Colors.blue.shade500,
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: BoxWidget(
                    title: 'Home 2',
                    wordsCount: 76,
                    bgColor: Colors.blue.shade600),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: BoxWidget(
                    title: 'Home 3',
                    wordsCount: 3,
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
                onTap: () {},
                child: BoxWidget(
                    title: 'Home 4',
                    wordsCount: 8,
                    bgColor: Colors.blue.shade800),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: BoxWidget(
                    title: 'Home 5',
                    wordsCount: 36,
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
                wordsCount: 8,
                bgColor: Colors.green,
              )),
            ],
          ),
        ],
      ),
    ));
  }
}
