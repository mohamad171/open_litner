import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_litner/controllers/WordController.dart';

class WordWidget extends StatelessWidget {
  WordWidget({super.key,required this.title,required this.description,this.wordId});
  String? title;
  String? description;
  String? wordId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder:(context) {
          return AlertDialog(content: Text("${description}"),);
        },);
        
      },
      onLongPress: () {
        
        showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Delete Record"),
        content: Text("Are you sure you want to delete this record? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog without action
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Get.find<Wordcontroller>().removeWord(wordId);
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
      },
      child: Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.blue.shade100, borderRadius: BorderRadius.circular(10),
          ),
          child: Text("${title}"),
    ),
    );
  }
}
