import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Intersex extends StatefulWidget {
  const Intersex({Key? key}) : super(key: key);

  @override
  _IntersexState createState() => _IntersexState();
}

class _IntersexState extends State<Intersex> {
  String text =
      "ntersexual : Una persona que presenta conjuntamente caracteres sexuales masculinos y femeninos.  ";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text,
        imagePath: "intersex.jpg",
        letter: "i",
        height: 275,
        width: 64);
  }
}
