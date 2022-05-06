import 'package:colored_json/colored_json.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/pagecontroller.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController controller;
  final PageControllers pageControllers;
  const HomeScreen(
      {Key? key, required this.controller, required this.pageControllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: dWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: dWidth(context) * 0.095,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    radius: dWidth(context) * 0.09,
                    backgroundImage: const AssetImage('assets/img/1.jpg'),
                  ),
                ),
                FittedBox(
                  child: Column(
                    children: [
                      Text(
                        "THIRUMURUGAN",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 7,
                            fontSize: 32.0 * text(context)),
                      ),
                      Text(
                        "Mobile App Developer, AI Kid \n Full Stack Developer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 4,
                            height: 1.5,
                            fontSize: 15.0 * text(context)),
                      )
                    ],
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      controller.animateTo(dHeight(context) * 6,
                          duration: defaultDuration, curve: Curves.easeInCubic);
                      pageControllers.getColor(int.parse(6.toString()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: primaryColor,
                              width: dsize(context) * 0.003)),
                      width: dWidth(context) * 0.2,
                      height: dHeight(context) * 0.06,
                      child: Center(
                          child: Text(
                        "Contact".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
            height: dHeight(context),
            width: (dWidth(context) - dWidth(context) * 0.05) / 2,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ColoredJson(
                  data: jsonData,
                  backgroundColor: Colors.transparent,
                  colonColor: primaryColor,
                  commaColor: Colors.white,
                  curlyBracketColor: Colors.white,
                  squareBracketColor: Colors.white,
                  keyColor: primaryColor,
                  boolColor: bodyTextColor,
                  textStyle: TextStyle(
                      height: 1.6,
                      fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                      fontSize: dsize(context) * 0.03,
                      fontWeight: FontWeight.bold),
                  indentLength: 10,
                  stringColor: bodyTextColor,
                ),
              ),
            ))
      ],
    );
  }
}
