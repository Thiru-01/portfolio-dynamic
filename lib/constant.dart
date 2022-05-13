import 'package:flutter/material.dart';

const primaryColor = Color(0xFF80F9CB);
const secondaryColor = Color(0xFFDD265D);
const darkColor = Color(0xFF092638);
const bodyTextColor = Color(0xFF2B808E);
const bgColor = Color(0xFF171F34);
const cardColor = Color(0xFF051723);
showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: bgColor,
    content: SizedBox(
        height: dHeight(context) * 0.3,
        width: dWidth(context) * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: secondaryColor,
            ),
            SizedBox(
              height: dHeight(context) * 0.08,
            ),
            const Text(
              "Uploading...",
              style: TextStyle(color: primaryColor),
            ),
          ],
        )),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Map<int, Color> color = const {
  50: Color.fromRGBO(128, 249, 203, .1),
  100: Color.fromRGBO(128, 249, 203, .2),
  200: Color.fromRGBO(128, 249, 203, .3),
  300: Color.fromRGBO(128, 249, 203, .4),
  400: Color.fromRGBO(128, 249, 203, .5),
  500: Color.fromRGBO(128, 249, 203, .6),
  600: Color.fromRGBO(128, 249, 203, .7),
  700: Color.fromRGBO(128, 249, 203, .8),
  800: Color.fromRGBO(128, 249, 203, .9),
  900: Color.fromRGBO(128, 249, 203, 1),
};
MaterialColor primaryswatch = MaterialColor(0xFF80F9CB, color);
List<Color> whichColor = const [Color(0xFF80F9CB), Color(0xFF2F5D79)];

const defaultPadding = 20.0;
const defaultDuration =
    Duration(milliseconds: 600); // we use it on our animation
const maxWidth = 1440.0;
mWidth(context) {
  return MediaQuery.of(context).size.width;
}

mHeight(context) {
  return MediaQuery.of(context).size.height;
}

dWidth(context) {
  return MediaQuery.of(context).size.width;
}

dHeight(context) {
  return MediaQuery.of(context).size.height;
}

dsize(context) {
  return (MediaQuery.of(context).size.height /
      50 *
      MediaQuery.of(context).size.width /
      50);
}

text(context) {
  return MediaQuery.of(context).textScaleFactor;
}

String jsonData = """
{
   "author":"Thirumurugan",
   "username":"@ThiruSaarah",
   "desciption":"Student | Flutter Developer | Fullstack Developer | AI Kid",
   "homepage":"www.saarah.com",
   "repository":{
      "type":"Open-source",
      "url":"https://github.com/Thiru-01"
   },
   "engines":[
      "C",
      "C++",
      "Html",
      "Js",
      "Css",
      "Python",
      "Dart",
      "Flutter"
   ],
   "dependencies":{
      "hardware":"Laptop",
      "type":"smart-worker",
      "flutter-developer":"^0.6",
      "python-developer":"^0.8",
      "web-developer":"^0.3"
   },
   "devDependencies":{
      "music":true,
      "internet":"100mbps",
      "editor":"vscode"
   }
}
""";
