
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        // TODO: Should add new Record dialog
      },
      child: Icon(Icons.add,color: Colors.white,),),
      body: Column(children: [
        Center(child: Text("Hello World"),)
      ],),
    ));
  }
}
