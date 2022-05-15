// ignore_for_file: must_be_immutable, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
            child: Obx(() => Column(
                  children: [
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 0 ? 0 : 1],
                        context: context,
                        label: "About",
                        icon: FontAwesomeIcons.userNinja,
                        paController: pageController,
                        controller: _controller,
                        pos: 0),
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 1 ? 0 : 1],
                        context: context,
                        label: "Education",
                        icon: FontAwesomeIcons.graduationCap,
                        check: true,
                        controllers: animationControllers,
                        controller: _controller,
                        paController: pageController,
                        pos: 1),
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 2 ? 0 : 1],
                        context: context,
                        label: "Skills",
                        icon: FontAwesomeIcons.laptopCode,
                        paController: pageController,
                        controllers: animationControllers,
                        controller: _controller,
                        pos: 2),
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 3 ? 0 : 1],
                        context: context,
                        label: "Experience",
                        icon: FontAwesomeIcons.building,
                        paController: pageController,
                        controllers: animationControllers,
                        controller: _controller,
                        pos: 3),
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 4 ? 0 : 1],
                        context: context,
                        label: "Projects",
                        icon: FontAwesomeIcons.codeFork,
                        controller: _controller,
                        paController: pageController,
                        pos: 4),
                    const Spacer(
                      flex: 3,
                    ),
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 6 ? 0 : 1],
                        context: context,
                        label: "Instagram",
                        icon: FontAwesomeIcons.instagram,
                        controller: _controller,
                        paController: pageController,
                        pos: 6),
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 7 ? 0 : 1],
                        context: context,
                        label: "Github",
                        paController: pageController,
                        icon: FontAwesomeIcons.github,
                        controller: _controller,
                        pos: 7),
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 8 ? 0 : 1],
                        context: context,
                        paController: pageController,
                        label: "LinkedIn",
                        icon: FontAwesomeIcons.linkedin,
                        controller: _controller,
                        pos: 8),
                  ],
                )),
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

  Expanded navIcon(
      {required Color color,
      required IconData icon,
      required int pos,
      required PageControllers paController,
      required var context,
      required String label,
      required ScrollController controller,
      AnimationControllers? controllers,
      bool check = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          printInfo(
              info:
                  "Moving to the Position $pos and it's height value is ${pos * dHeight(context)}");
          if (check) {
            Future.delayed(const Duration(milliseconds: 400),
                () => controllers!.startAnimation());
          }
          if (pos == 3) {
            Future.delayed(const Duration(milliseconds: 500),
                () => controllers!.changeOpacity());
          }
          if (pos == 2) {
            controllers!.changeAni();
          }
          if (pos < 6) {
            controller.animateTo(dHeight(context) * pos,
                duration: defaultDuration, curve: Curves.easeInCubic);
            paController.getColor(int.parse(pos.toString()));
          }
          if (pos == 6) {
            html.window
                .open("https://www.instagram.com/mr_aegon_01/", "_blank");
          }
          if (pos == 7) {
            html.window.open("https://github.com/Thiru-01", "_blank");
          }
          if (pos == 8) {
            html.window.open(
                "https://www.linkedin.com/in/thiru-candane-1067701b8/",
                "_blank");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Tooltip(
              message: label,
              child: Icon(
                icon,
                size: dsize(context) * 0.06,
                color: color,
              ),
            ),
          )),
        ),
      ),
    );
  }
}
