import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Lesbian extends StatefulWidget {
  const Lesbian({Key? key}) : super(key: key);

  @override
  _LesbianState createState() => _LesbianState();
}

class _LesbianState extends State<Lesbian> {
  String text = "esbianas : Una mujer que se siente atraída por otra mujeres";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text,
        imagePath: "lesbian.jpg",
        letter: "l",
        height: 263,
        width: 197);
  }
}

class Gay extends StatefulWidget {
  const Gay({Key? key}) : super(key: key);

  @override
  _GayState createState() => _GayState();
}

class _GayState extends State<Gay> {
  String text = " ays : un hombre que se siente atraído por otro hombre";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text, imagePath: "gay.jpg", letter: "g", height: 261, width: 241);
  }
}
