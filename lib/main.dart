import 'package:flutter/material.dart';
import 'package:lgbtposter/B.dart';
import 'package:lgbtposter/G.dart';
import 'package:lgbtposter/L.dart';
import 'package:lgbtposter/descs/asexual.dart';
import 'package:lgbtposter/descs/bi.dart';
import 'package:lgbtposter/descs/intersex.dart';
import 'package:lgbtposter/descs/lesbian.dart';
import 'package:lgbtposter/descs/plus.dart';
import 'package:lgbtposter/descs/queer.dart';
import 'package:lgbtposter/descs/trans.dart';
import 'package:lgbtposter/letter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LGBTQIA+',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Alignment alignment = Alignment.center;
  bool isShown = false;
  int page = 0;
  double height = 200;
  PageController pageController = PageController(initialPage: 0);
  void changeAlignment(int letter) {
    setState(() {
      isShown = true;
      if (letter == page) {
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
        page = 0;
      } else {
        try {
          pageController.animateToPage(letter,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          page = letter;
        } catch (e) {}
      }

      // alignment = Alignment.topCenter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Stack(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 90),
              alignment: Alignment.topCenter,
              child: Text("que significa las letras del sigle LGBTQIA+ ? "),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2 + 50),
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height / 2 - 50,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                          "para saber más, tienen que cliquear las letras !"),
                    ),
                  ),
                  Lesbian(),
                  Gay(),
                  Bisexual(),
                  Column(
                    children: [Trans(), TransSexual()],
                  ),
                  Queer(),
                  Intersex(),
                  Asexual(),
                  Plus()
                ],
              ),
            ),
            AnimatedAlign(
              alignment: alignment,
              duration: Duration(milliseconds: 500),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width / 5),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ZoomableL(
                          action: () {
                            changeAlignment(1);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 1
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ZoomableG(action: () {
                          changeAlignment(2);
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 2
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ZoomableB(action: () {
                          changeAlignment(3);
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 3
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Letter(
                            action: () {
                              changeAlignment(4);
                            },
                            letter: "t",
                            height: 259,
                            width: 238,
                            imagePath: "trans.jpg"),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 4
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Letter(
                            action: () {
                              changeAlignment(5);
                            },
                            letter: "q",
                            height: 292,
                            width: 268,
                            imagePath: "queer.jpg"),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 5
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Letter(
                            action: () {
                              changeAlignment(6);
                            },
                            letter: "i",
                            height: 275,
                            width: 64,
                            imagePath: "intersex.jpg"),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 6
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Letter(
                            action: () {
                              changeAlignment(7);
                            },
                            letter: "a",
                            height: 272,
                            width: 274,
                            imagePath: "asexuel.jpg"),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 7
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Letter(
                          action: () {
                            changeAlignment(8);
                          },
                          letter: "plus",
                          height: 154,
                          width: 154,
                          imagePath: "plus.jpg",
                          optionalHeight: 100,
                        ),
                        SizedBox(
                          height: height - 100 + 10,
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: page == 8
                              ? CircleAvatar(
                                  maxRadius: 2,
                                  backgroundColor: Colors.grey,
                                )
                              : Container(
                                  height: 0,
                                  width: 0,
                                ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
