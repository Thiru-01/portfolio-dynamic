// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/animationcontroller.dart';
import 'package:portfolio/controller/pagecontroller.dart';
import 'package:portfolio/screens/edu.dart';
import 'package:portfolio/screens/home.dart';
import 'package:portfolio/screens/prj.dart';
import 'package:portfolio/screens/skills.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationControllers animationControllers = AnimationControllers();
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
                    navIcon(
                        color: whichColor[
                            pageController.position.value == 5 ? 0 : 1],
                        context: context,
                        label: "Bio",
                        icon: FontAwesomeIcons.idBadge,
                        controller: _controller,
                        paController: pageController,
                        pos: 5),
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
                  child: const ProjectScreen(),
                ),
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
                    : const SizedBox()),
                SizedBox(
                  height: dHeight(context),
                ),
                SizedBox(
                  height: dHeight(context),
                ),
                SizedBox(
                  height: dHeight(context),
                ),
                SizedBox(
                  height: dHeight(context),
                ),
                SizedBox(
                  height: dHeight(context),
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
          if (check) {
            Future.delayed(const Duration(milliseconds: 400),
                () => controllers!.startAnimation());
          }

          if (pos == 2) {
            controllers!.changeAni();
          }

          controller.animateTo(dHeight(context) * pos,
              duration: defaultDuration, curve: Curves.easeInCubic);
          paController.getColor(int.parse(pos.toString()));
        },
        child: Padding(
          padding: EdgeInsets.all(dsize(context) * 0.01),
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
