import 'package:flutter/material.dart';

void showMessage(message,context){
  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
}