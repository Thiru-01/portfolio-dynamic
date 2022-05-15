import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/animationcontroller.dart';

import 'package:timeline_tile/timeline_tile.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationControllers controllers = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            height: dHeight(context),
            width: dWidth(context) / 2,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    isFirst: true,
                    endChild: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          child: Obx(() => AnimatedContainer(
                              padding:
                                  EdgeInsets.only(left: controllers.pad.value),
                              curve: Curves.easeInExpo,
                              duration: const Duration(milliseconds: 1000),
                              child: AnimatedOpacity(
                                  opacity: controllers.opacity.value,
                                  duration: const Duration(milliseconds: 400),
                                  child: const Text(
                                    "GSK Technology",
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3),
                                  )))),
                        ),
                      ],
                    ),
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: secondaryColor,
                    ),
                    beforeLineStyle: const LineStyle(
                      color: primaryColor,
                      thickness: 6,
                    ),
                  ),
                  const TimelineDivider(
                    begin: 0.1,
                    end: 0.8,
                    thickness: 6,
                    color: primaryColor,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.8,
                    beforeLineStyle: const LineStyle(
                      color: primaryColor,
                      thickness: 6,
                    ),
                    afterLineStyle: const LineStyle(
                      color: primaryColor,
                      thickness: 6,
                    ),
                    indicatorStyle: const IndicatorStyle(
                      width: 20,
                      color: secondaryColor,
                    ),
                    startChild: SizedBox(
                      child: Obx(() => Align(
                            alignment: Alignment.centerRight,
                            child: AnimatedContainer(
                                padding: EdgeInsets.only(
                                    right: controllers.pad.value),
                                curve: Curves.easeInExpo,
                                duration: const Duration(milliseconds: 1000),
                                child: AnimatedOpacity(
                                    opacity: controllers.opacity.value,
                                    duration: const Duration(milliseconds: 400),
                                    child: const Text(
                                      "Oli PEC ATAL",
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 3),
                                    ))),
                          )),
                    ),
                  ),
                  const TimelineDivider(
                    begin: 0.1,
                    end: 0.8,
                    thickness: 6,
                    color: primaryColor,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.1,
                    beforeLineStyle: const LineStyle(
                      color: primaryColor,
                      thickness: 6,
                    ),
                    endChild: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          child: Obx(() => AnimatedContainer(
                              padding:
                                  EdgeInsets.only(left: controllers.pad.value),
                              curve: Curves.easeInExpo,
                              duration: const Duration(milliseconds: 1000),
                              child: AnimatedOpacity(
                                  opacity: controllers.opacity.value,
                                  duration: const Duration(milliseconds: 400),
                                  child: const Text(
                                    "Whirlpool",
                                    style: TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3),
                                  )))),
                        ),
                      ],
                    ),
                    afterLineStyle:
                        const LineStyle(color: primaryColor, thickness: 6),
                    indicatorStyle:
                        const IndicatorStyle(width: 20, color: secondaryColor),
                  ),
                  const TimelineDivider(
                    color: primaryColor,
                    thickness: 6,
                    end: 0.8,
                    begin: 0.1,
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.8,
                    isLast: true,
                    startChild: SizedBox(
                      child: Obx(() => Align(
                            alignment: Alignment.centerRight,
                            child: AnimatedContainer(
                                padding: EdgeInsets.only(
                                    right: controllers.pad.value),
                                curve: Curves.easeInExpo,
                                duration: const Duration(milliseconds: 1000),
                                child: AnimatedOpacity(
                                    opacity: controllers.opacity.value,
                                    duration: const Duration(milliseconds: 400),
                                    child: const Text(
                                      "Eminds",
                                      style: TextStyle(
                                          color: secondaryColor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 3),
                                    ))),
                          )),
                    ),
                    beforeLineStyle: const LineStyle(
                      color: primaryColor,
                      thickness: 6,
                    ),
                    afterLineStyle:
                        const LineStyle(color: primaryColor, thickness: 6),
                    indicatorStyle:
                        const IndicatorStyle(width: 20, color: secondaryColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text: "GSK Technology",
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: dsize(context) * 0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .fontFamily),
                      children: [
                        TextSpan(
                          text: "\nJan 2021 – Feb 2021",
                          style: TextStyle(
                              fontSize: dsize(context) * 0.025,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                            text:
                                "\n\nCreated video processing software from real-time stream of CCTV footage using Python and OpenCV with team.",
                            style: TextStyle(
                                color: bodyTextColor,
                                fontSize: dsize(context) * 0.03))
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: "OLI Technology",
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: dsize(context) * 0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .fontFamily),
                      children: [
                        TextSpan(
                          text: "\nOct 2021 – Dec 2021",
                          style: TextStyle(
                              fontSize: dsize(context) * 0.025,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                            text:
                                "\n\nWorked as Intern for the role of app developer (Flutter) for both Android and iOS in OLI Technology start-up company in ATAL PECF (Pondicherry Engineering College Foundation)",
                            style: TextStyle(
                                color: bodyTextColor,
                                fontSize: dsize(context) * 0.03))
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: "Whirlpool",
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: dsize(context) * 0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .fontFamily),
                      children: [
                        TextSpan(
                          text: "\nFeb 2022 – Feb 2022",
                          style: TextStyle(
                              fontSize: dsize(context) * 0.025,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                            text:
                                "\n\nDeveloped Flutter app for android integrated with Apps Script",
                            style: TextStyle(
                                color: bodyTextColor,
                                fontSize: dsize(context) * 0.03))
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: "Enterprise Minds",
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: dsize(context) * 0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .fontFamily),
                      children: [
                        TextSpan(
                          text: "\nJan 2022 – Present",
                          style: TextStyle(
                              fontSize: dsize(context) * 0.025,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                            text:
                                "\n\nDeveloping Android and iOS App using Flutter in responsive manner.",
                            style: TextStyle(
                                color: bodyTextColor,
                                fontSize: dsize(context) * 0.03))
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
