import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';

import 'package:shimmer/shimmer.dart';

class Letter extends StatefulWidget {
  final Function action;
  final String letter;
  final double height;
  final double width;
  final String imagePath;
  final double optionalHeight;
  const Letter({
    required this.action,
    required this.letter,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.optionalHeight,
  });

  @override
  _LetterState createState() => _LetterState();
}

class _LetterState extends State<Letter> {
  double height = 261;
  double width = 223;

  double wantedHeight = 200;
  double wantedWidth = 0;
  double heightPercentage = 0.005;
  double widthPercentage = 0.008;

  @override
  void initState() {
    height = widget.height;
    width = widget.width;

    wantedHeight = widget.optionalHeight;

    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void checkingHeight() {
    setState(() {
      //ajusting size, based on experimental values
      if (MediaQuery.of(context).size.width > 1325 &&
          MediaQuery.of(context).size.height > 608) {
        heightPercentage = 0.005;
        widthPercentage = 0.008;
        wantedHeight = widget.optionalHeight;
      } else if (MediaQuery.of(context).size.width >= 1015 &&
          MediaQuery.of(context).size.height >= 542) {
        heightPercentage = 0.015;
        widthPercentage = 0.02;
        wantedHeight = widget.optionalHeight * 3 / 4;
      } else if (MediaQuery.of(context).size.width >= 737 &&
          MediaQuery.of(context).size.height >= 649) {
        wantedHeight = widget.optionalHeight * 1 / 2;
      } else if (MediaQuery.of(context).size.width >= 467 &&
          MediaQuery.of(context).size.height >= 359) {
        wantedHeight = widget.optionalHeight * 1 / 3;
      } else if (MediaQuery.of(context).size.width >= 0 &&
          MediaQuery.of(context).size.height >= 0) {
        wantedHeight = widget.optionalHeight * 1 / 5;
        heightPercentage = 0.02;
        widthPercentage = 0.03;
      }
      wantedWidth = width * wantedHeight / height;
    });
  }

  @override
  Widget build(BuildContext context) {
    wantedWidth = width * wantedHeight / height;
    if (widget.optionalHeight > 40) {
      checkingHeight();
    } else {
      if (widget.letter == "b") {
        widthPercentage = 0.03;
      }
    }

    return InkWell(
      radius: 100,
      onTap: () {
        widget.action();
      },
      child: Container(
        height: wantedHeight - (0.1 * wantedHeight),
        width: wantedWidth - (0.1 * wantedWidth),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(height: wantedHeight, width: wantedWidth),
            Padding(
              padding: widget.letter == "plus"
                  ? EdgeInsets.symmetric(
                      horizontal: wantedWidth * 0.03,
                      vertical: wantedHeight * 0.03)
                  : EdgeInsets.symmetric(
                      horizontal: wantedWidth * widthPercentage,
                      vertical: wantedHeight * heightPercentage),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Hero(
                  tag: widget.letter,
                  child: kIsWeb
                      ? CachedNetworkImage(
                          placeholder: (context, url) {
                            return Shimmer.fromColors(
                              period: Duration(milliseconds: 700),
                              child: Container(
                                color: Colors.grey,
                              ),
                              baseColor: Colors.grey[300] ?? Colors.grey,
                              highlightColor: Colors.grey[100] ?? Colors.grey,
                            );
                          },
                          imageUrl: "assets/${widget.imagePath}",
                          height: wantedHeight,
                          width: wantedWidth,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/${widget.imagePath}",
                          height: wantedHeight,
                          width: wantedWidth,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            kIsWeb
                ? CachedNetworkImage(
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        period: Duration(milliseconds: 700),
                        child: Container(
                          color: Colors.grey,
                        ),
                        baseColor: Colors.grey[300] ?? Colors.grey,
                        highlightColor: Colors.grey[100] ?? Colors.grey,
                      );
                    },
                    imageUrl: "assets/${widget.letter.toUpperCase()}.png",
                    height: wantedHeight,
                    width: wantedWidth,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    "assets/${widget.letter.toUpperCase()}.png",
                    height: wantedHeight,
                    width: wantedWidth,
                    fit: BoxFit.fill,
                  ),
          ],
        ),
      ),
    );
  }
}
