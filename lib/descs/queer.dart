import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Queer extends StatefulWidget {
  const Queer({Key? key}) : super(key: key);

  @override
  _QueerState createState() => _QueerState();
}

class _QueerState extends State<Queer> {
  String text =
      "ueer : Una palabra que hace referencia a todas las identidades que representa la comunidad LGBTQIA+";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text, imagePath: "bi.jpg", letter: "q", height: 292, width: 268);
  }
}
