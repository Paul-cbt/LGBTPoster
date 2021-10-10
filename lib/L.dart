import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';

import 'package:shimmer/shimmer.dart';

class ZoomableL extends StatefulWidget {
  final Function action;
  const ZoomableL({required this.action});

  @override
  _ZoomableLState createState() => _ZoomableLState();
}

class _ZoomableLState extends State<ZoomableL> {
  double height = 263;
  double width = 197;

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
                tag: "l",
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
                        imageUrl: "assets/lesbian.jpg",
                        height: wantedHeight,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/lesbian.jpg",
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
                    imageUrl: "assets/L.png",
                    height: wantedHeight,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/L.png",
                    height: wantedHeight,
                    fit: BoxFit.cover,
                  ),
          ],
        ),
      ),
    );
  }
}
