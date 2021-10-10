import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Asexual extends StatefulWidget {
  const Asexual({Key? key}) : super(key: key);

  @override
  _AsexualState createState() => _AsexualState();
}

class _AsexualState extends State<Asexual> {
  String text =
      "sexual : Una persona que no siente ningun tipo de atraccion sexual";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text,
        imagePath: "asexuel.jpg",
        letter: "a",
        height: 272,
        width: 274);
  }
}
