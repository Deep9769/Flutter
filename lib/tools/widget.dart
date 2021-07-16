import 'package:flutter/material.dart';

TextStyle selectLanguageTextStyle() {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.purple,
  );
}

TextStyle bigTextStyle() {
  return TextStyle(
    color: Color(0xff03032e),
    fontWeight: FontWeight.w700,
    fontSize: 25,
  );
}

TextStyle profileTextStyle() {
  return TextStyle(
    color: Color(0xff03032E),
    fontWeight: FontWeight.w500,
    fontSize: 23,
  );
}

TextStyle elevatedButtonTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 25,
    fontStyle: FontStyle.italic,
  );
}

BoxDecoration eBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: Color(0xff03032E),
      width: 2.0,
      style: BorderStyle.solid,
    ),
    //borderRadius: BorderRadius.circular(30),
  );
}

AppBar eAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.indigo,
    title: Center(
      child: Text(
        "Liveasy",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          decorationColor: Colors.teal,
          //backgroundColor: Colors.green,
        ),
      ),
    ),
  );
}

