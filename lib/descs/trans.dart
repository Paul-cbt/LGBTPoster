import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Trans extends StatefulWidget {
  const Trans({Key? key}) : super(key: key);

  @override
  _TransState createState() => _TransState();
}

class _TransState extends State<Trans> {
  String text =
      "ransgeneros : son personas que no se sienten identificadas con el sexo biológico que les fue otorgado en el nacimiento";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text,
        imagePath: "trans.jpg",
        letter: "t",
        height: 259,
        width: 238);
  }
}

class TransSexual extends StatefulWidget {
  const TransSexual({Key? key}) : super(key: key);

  @override
  _TransSexualState createState() => _TransSexualState();
}

class _TransSexualState extends State<TransSexual> {
  String text =
      "ransexuales : Son personas cuya identidad de género está en discordancia con su sexo biológico e identidad sexual. Por ello se someten a procedimientos hormonales y quirúrgicos para homogeneizar este aspecto";
  @override
  Widget build(BuildContext context) {
    return Info(
        text: text,
        imagePath: "trans.jpg",
        letter: "t",
        height: 259,
        width: 238);
  }
}
