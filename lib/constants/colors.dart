import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color Red = Color(0XFFD81159);

//--------------------Colors-------------------------------
Color cPrimary = Colors.red;
Color cPrimaryLight = Color(0XFF006BA6);
Color cW = Colors.white;
Color cB = Colors.black;
Color cGrey = const Color.fromARGB(255, 118, 118, 118);
Color cTextColor = Colors.black;
Color cDeactive = const Color.fromARGB(255, 228, 228, 228);
Color cBLowOpacity = const Color.fromARGB(255, 218, 218, 218);
Color cBLowOpacityText = const Color.fromARGB(255, 117, 117, 117);
Color cBgColor = const Color.fromARGB(255, 244, 244, 244);
Color cPurple = const Color.fromARGB(255, 151, 88, 249);
Color cPurpleLight = const Color.fromARGB(255, 188, 149, 252);

LinearGradient linearSubscribe = const LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color.fromRGBO(206, 67, 253, 1),
      Color.fromRGBO(254, 113, 124, 1),
    ]);

//--------------------Shadows-------------------------------
BoxShadow bs010 = BoxShadow(
    blurRadius: 35,
    offset: const Offset(0, 10),
    color: Colors.black.withOpacity(.2));