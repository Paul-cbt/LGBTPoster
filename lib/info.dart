import 'package:flutter/material.dart';
import 'package:lgbtposter/letter.dart';

class Info extends StatefulWidget {
  final String letter;
  final double height;
  final double width;
  final String text;
  final String imagePath;
  const Info(
      {Key? key,
      required this.text,
      required this.imagePath,
      required this.letter,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  double fontSize = 15;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.height * MediaQuery.of(context).size.width <
        317400) {
      fontSize = 12;
    } else {
      fontSize = 15;
    }
    return Center(
      child: Container(
          padding: EdgeInsets.all(8),
          constraints: BoxConstraints(
            maxWidth: 450,
          ),
          child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(children: [
                WidgetSpan(
                  child: Letter(
                    action: () {},
                    letter: widget.letter,
                    height: widget.height,
                    width: widget.width,
                    imagePath: widget.imagePath,
                    optionalHeight:
                        fontSize + (widget.letter != "plus" ? 10 : 2),
                  ),
                ),
                if (widget.letter == "b")
                  WidgetSpan(
                      child: Container(
                    width: 3,
                  )),
                if (widget.letter == "i")
                  WidgetSpan(
                      child: Container(
                    width: 2,
                  )),
                TextSpan(
                  text: widget.text,
                  style: TextStyle(fontSize: fontSize, color: Colors.black),
                )
              ]))),
    );
  }
}
