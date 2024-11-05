import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordWidget extends StatelessWidget {
  WordWidget({super.key,required this.title,required this.description});
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder:(context) {
          return AlertDialog(content: Text("${description}"),);
        },);
      },
      child: Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.blue.shade100, borderRadius: BorderRadius.circular(10),
          ),
          child: Text("${title}"),
    ),
    );
  }
}
