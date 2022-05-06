import 'package:flutter/material.dart';
import 'package:portfolio/constant.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Row(
          children: [
            Wrap(
              spacing: 20,
              direction: Axis.vertical,
              children: [
                skillProgress(
                  context: context,
                  name: "C",
                  value: 0.75,
                ),
                skillProgress(context: context, name: "Java", value: 0.7),
                skillProgress(context: context, name: "C++", value: 0.85),
                skillProgress(context: context, name: "Html", value: 0.70),
                skillProgress(context: context, name: "Python", value: 0.80),
                skillProgress(context: context, name: "Css", value: 0.70),
                skillProgress(context: context, name: "Dart", value: 0.80),
                skillProgress(context: context, name: "Flutter", value: 0.85),
                skillProgress(
                    context: context, name: "AI(Deep Learning)", value: 0.75),
                skillProgress(context: context, name: "Js", value: 0.65),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    detailsChip(context,
                        title: "C/C++",
                        textV: "Mainly used only for computative coding"),
                    detailsChip(context,
                        title: "Python",
                        textV:
                            "I used python as a great programming language for scraping data from web pages, building simple UI-based applications, Whatsapp automation as well as modern GUIs."),
                    detailsChip(context,
                        title: "Html/Css/Js",
                        textV:
                            "My first portfolio was my first web page which was developed by me. I just learned lots of information during that project. Html/Css/Js are very simple to learn. So that i just make a look at those stuff then makes a understanding and then implemented it"),
                    detailsChip(context,
                        title: "AI",
                        textV:
                            "I'm in the learning stage of AI more are less im just a script kiddy but i have huge interset to learn AI and i want to specialist in this specific domain"),
                    detailsChip(context,
                        title: "Flutter/Dart",
                        textV:
                            "Flutter/Dart are my one of the most favorite language. At the beginning I was unable to understand every concept, clearly, later on I just practiced it, then it because easier to understand and learn now im in the intermediate stage."),
                    detailsChip(context,
                        title: "Java",
                        textV:
                            "Java I just learned it during my academic syllabus. I have an basic knowledge in java"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column detailsChip(BuildContext context,
      {required String textV, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: primaryColor,
            fontSize: 18.0 * text(context),
          ),
        ),
        Text(textV)
      ],
    );
  }

  Padding skillProgress({
    required BuildContext context,
    required String name,
    required double value,
  }) {
    return Padding(
      padding: EdgeInsets.all(dsize(context) * 0.06),
      child: SizedBox(
        height: dHeight(context) * 0.1,
        width: dWidth(context) * 0.2,
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            curve: Curves.easeInOutCubic,
            duration: const Duration(milliseconds: 1400),
            builder: (context, double val, _) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          (val * 100).ceilToDouble().toString() + "%",
                          style: const TextStyle(color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: dHeight(context) * 0.02,
                  ),
                  SizedBox(
                    width: dWidth(context) * 0.25,
                    height: dHeight(context) * 0.01,
                    child: LinearProgressIndicator(
                      value: val,
                      backgroundColor: darkColor,
                      color: primaryColor,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
