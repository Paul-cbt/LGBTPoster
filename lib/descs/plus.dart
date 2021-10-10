import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Plus extends StatefulWidget {
  const Plus({Key? key}) : super(key: key);

  @override
  _PlusState createState() => _PlusState();
}

class _PlusState extends State<Plus> {
  String text = "plus: ";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text,
        imagePath: "plus.jpg",
        letter: "plus",
        height: 154,
        width: 154);
  }
}
