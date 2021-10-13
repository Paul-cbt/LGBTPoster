import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';
import 'package:lgbtposter/descs/asexual.dart';
import 'package:lgbtposter/descs/bi.dart';
import 'package:lgbtposter/descs/intersex.dart';
import 'package:lgbtposter/descs/lesbian.dart';
import 'package:lgbtposter/descs/plus.dart';
import 'package:lgbtposter/descs/queer.dart';
import 'package:lgbtposter/descs/trans.dart';
import 'package:lgbtposter/letter.dart';
import 'package:url_launcher/url_launcher.dart';

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
        primaryColor: Colors.white,
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
  @override
  void initState() {
    final loader = document.getElementsByClassName('loader');
    if (loader.isNotEmpty) {
      loader.first.remove();
      //remove the loading in the html file
    }
    super.initState();
  }

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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Stack(
            children: [
              if (kIsWeb && MediaQuery.of(context).size.width > 600)
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        launch("https://github.com/Paul-cbt/LGBTPoster");
                      },
                      child: Text(
                        "GitHub",
                        style: TextStyle(color: Colors.grey),
                      )),
                ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 90),
                alignment: Alignment.topCenter,
                child: Text(
                  "que significan las letras dela siglas LGBTQIA+ ? ",
                  textAlign: TextAlign.center,
                ),
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
                          "para saber más, tienen que cliquear las letras !",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Lesbian(),
                    Gay(),
                    Bisexual(),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [Trans(), TransSexual()],
                        ),
                      ),
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
                    bottom: MediaQuery.of(context).size.height / 15,
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Letter(
                              action: () {
                                changeAlignment(1);
                              },
                              letter: "l",
                              height: 263,
                              optionalHeight: height,
                              width: 197,
                              imagePath: "lesbian.jpg"),
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
                          Letter(
                              action: () {
                                changeAlignment(2);
                              },
                              optionalHeight: height,
                              letter: "g",
                              height: 261,
                              width: 241,
                              imagePath: "gay.jpg"),
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
                          Letter(
                              action: () {
                                changeAlignment(3);
                              },
                              optionalHeight: height,
                              letter: "b",
                              height: 261,
                              width: 223,
                              imagePath: "bi.jpg"),
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
                              optionalHeight: height,
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
                              optionalHeight: height,
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
                              optionalHeight: height,
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
                              optionalHeight: height,
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
                            optionalHeight: height / 2,
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
      ),
    );
  }
}
