// ignore_for_file: must_be_immutable, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/components.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/animationcontroller.dart';
import 'package:portfolio/controller/pagecontroller.dart';
import 'package:portfolio/screens/edu.dart';
import 'package:portfolio/screens/exp.dart';
import 'package:portfolio/screens/home.dart';
import 'package:portfolio/screens/prj.dart';
import 'package:portfolio/screens/skills.dart';
import 'dart:html' as html;

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationControllers animationControllers = Get.put(AnimationControllers());
    ScrollController _controller = ScrollController();
    PageControllers pageController = Get.put(PageControllers());
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Material(
          elevation: 15,
          child: SizedBox(
            width: dWidth(context) * 0.05,
            height: dHeight(context),
            child: Obx(() => navbar(
                pageController, context, _controller, animationControllers)),
          ),
        ),
        SizedBox(
          width: dWidth(context) - (dWidth(context) * 0.05),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            child: Column(
              children: [
                SizedBox(
                  height: dHeight(context),
                  child: HomeScreen(
                      controller: _controller, pageControllers: pageController),
                ),
                SizedBox(
                  height: dHeight(context),
                  child: EducationPage(
                    controller: animationControllers,
                  ),
                ),
                Obx(() => animationControllers.chechAni.value
                    ? SizedBox(
                        height: dHeight(context),
                        child: const SkillScreen(),
                      )
                    : SizedBox(
                        height: dHeight(context),
                      )),
                SizedBox(
                  height: dHeight(context),
                  child: const ExperienceScreen(),
                ),
                SizedBox(
                  height: dHeight(context),
                  child: const ProjectScreen(),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
