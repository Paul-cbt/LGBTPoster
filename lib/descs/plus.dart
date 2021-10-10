import 'package:flutter/material.dart';
import 'package:lgbtposter/info.dart';

class Plus extends StatefulWidget {
  const Plus({Key? key}) : super(key: key);

  @override
  _PlusState createState() => _PlusState();
}

class _PlusState extends State<Plus> {
  String text =
      " : son todos los otros, las siglas las más largas son: LGBTTQQIAAP : lesbian, gay, bisexual, transgenero, transexual, queer, “questioning” ( personas que se hacen preguntas sobre su sexualidad), intersex, asexual, pansexuels (personas que se sienten atraido-a por todos los generos ). También podemos ver la letra O “otros” para los otros";
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
