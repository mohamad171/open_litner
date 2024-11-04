// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_litner/constants/utils.dart';

import '../widgets/word_widget.dart';

class WordsScreen extends StatelessWidget {
  WordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          onTap:() {
            Get.back();
          },
          child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        ),
      ),
      appBar: AppBar(
        title: Text("Home 1",style: TextStyle(color: Colors.white),),
        elevation: 12,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: Row(children: [
          Icon(Icons.arrow_back,color: Colors.white,)
        ],),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Dismissible(
                key: Key("1"),
                background: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              color: Colors.green,
              
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              color: Colors.red
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                // TODO Move word to next home
                showMessage("Ok, Word moved to next home", context);
              } else {
                showMessage('Oh! Sorry, Word moved to first home.', context);
              }
              return false;
            },
                child: WordWidget(),
                direction: DismissDirection.horizontal,
              )
            ],
          ))
        ],
      ),
    ));
  }
}
