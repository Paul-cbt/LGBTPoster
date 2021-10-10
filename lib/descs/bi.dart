import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Bisexual extends StatefulWidget {
  const Bisexual({Key? key}) : super(key: key);

  @override
  _BisexualState createState() => _BisexualState();
}

class _BisexualState extends State<Bisexual> {
  String text =
      "isexuales : Una persona que se siente atraída-o por una persona del mismo género o por una persona del género oposito";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text, imagePath: "bi.jpg", letter: "b", height: 261, width: 223);
  }
}
