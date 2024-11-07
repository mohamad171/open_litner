// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_litner/constants/utils.dart';
import 'package:open_litner/controllers/WordController.dart';
import 'package:open_litner/main.dart';

import '../widgets/word_widget.dart';

class WordsScreen extends GetView<Wordcontroller> {
  WordsScreen({super.key});

  void init() {
    controller.getBoxWords(Get.arguments["box"]);
    controller.boxNumber(Get.arguments['box']);
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
          
            showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Word'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.wordEditingController,
                decoration: InputDecoration(
                  labelText: 'Word',
                
                ),
              ),
              TextField(
                controller: controller.descriptionEditingController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              onPressed: () {
                // final String title = _titleController.text;
                // final String description = _descriptionController.text;
                
                // Navigator.of(context).pop({
                //   'title': title,
                //   'description': description,
                // });
                if(controller.wordEditingController.text.trim().length > 0 &&
                controller.descriptionEditingController.text.trim().length > 0 ){

                  controller.createWord(controller.wordEditingController.text.trim(),
                   controller.descriptionEditingController.text.trim());


                }
              },
              child: Obx(() => (controller.addWordLoading.isTrue) ? CircularProgressIndicator(color: Colors.white,) : Text('Submit',style: TextStyle(color: Colors.white),),),
            ),
          ],
        );
      },
    );
      
        },
        child: Icon(
            Icons.add,
            color: Colors.white,
          ),
     
      ),
      appBar: AppBar(
        title: Obx(() => Text(
          "Home ${ controller.boxNumber.value + 1}",
          style: TextStyle(color: Colors.white),
        ),),
        elevation: 12,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              GestureDetector(
                child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onTap: (){
                Get.back();
              },
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
                    controller.correctWord(item.$id);
                    

                  } else {
                    controller.inCorrectWord(item.$id);
                  }
                  return false;
                },
                child: WordWidget(title:item.data["title"],description: item.data["description"],wordId: item.$id,),
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
