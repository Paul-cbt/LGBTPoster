import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';

import 'package:shimmer/shimmer.dart';

class ZoomableB extends StatefulWidget {
  final Function action;
  const ZoomableB({required this.action});

  @override
  _ZoomableBState createState() => _ZoomableBState();
}

class _ZoomableBState extends State<ZoomableB> {
  double height = 261;
  double width = 223;

  double wantedHeight = 200;
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
                tag: "b",
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
                        imageUrl: "assets/bi.jpg",
                        height: wantedHeight,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/bi.jpg",
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
                    imageUrl: "assets/B.png",
                    height: wantedHeight,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/B.png",
                    height: wantedHeight,
                    fit: BoxFit.cover,
                  ),
          ],
        ),
      ),
    );
  }
}
