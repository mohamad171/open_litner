import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  String? title;
  int? wordsCount;
  Color? bgColor;
  BoxWidget({super.key, required this.title, required this.wordsCount,this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 100,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: bgColor ?? Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${title}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${wordsCount} Word(s)",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              );
  }
}