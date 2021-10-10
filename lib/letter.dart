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
  final double? optionalHeight;
  const Letter({
    required this.action,
    required this.letter,
    required this.height,
    required this.width,
    required this.imagePath,
    this.optionalHeight,
  });

  @override
  _LetterState createState() => _LetterState();
}

class _LetterState extends State<Letter> {
  double height = 261;
  double width = 223;

  double wantedHeight = 200;
  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    if (widget.optionalHeight != null) {
      wantedHeight = widget.optionalHeight ?? 200;
    }
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    double wantedWidth = width * wantedHeight / height;

    return InkWell(
      radius: 100,
      onTap: () {
        widget.action();
      },
      child: Container(
        height: wantedHeight,
        width: wantedWidth,
        child: Stack(
          children: [
            Container(height: wantedHeight, width: wantedWidth),
            Container(
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
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/${widget.imagePath}",
                        height: wantedHeight,
                        fit: BoxFit.cover,
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
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/${widget.letter.toUpperCase()}.png",
                    height: wantedHeight,
                    fit: BoxFit.cover,
                  ),
          ],
        ),
      ),
    );
  }
}
