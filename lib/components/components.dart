import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/animationcontroller.dart';
import 'package:portfolio/controller/pagecontroller.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class CustomCard extends StatelessWidget {
  final String eduData;
  final String location;
  final String percent;
  final String detials;
  const CustomCard({
    Key? key,
    required this.eduData,
    required this.location,
    required this.percent,
    required this.detials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dHeight(context) * 0.4,
      width: dWidth(context) * 0.25,
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: cardColor,
                spreadRadius: 2.0,
                blurRadius: 20.0,
                offset: Offset(3.0, 3.0))
          ]),
      child: Padding(
        padding: EdgeInsets.all(dWidth(context) * 0.01),
        child: cardData(
          context: context,
          eduData: eduData,
          percent: "88.8",
          place: "Puducherry",
          detials: detials,
        ),
      ),
    );
  }

  Column cardData(
      {required BuildContext context,
      required String eduData,
      required String detials,
      required,
      required String place,
      required String percent}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FittedBox(
          child: Text(
            eduData,
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17.0 * text(context)),
          ),
        ),
        Text(
          detials,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.fade,
        ),
        rowTextIcon(
            context: context, text: place, icon: FontAwesomeIcons.locationDot),
        rowTextIcon(
            context: context, text: "88.8", icon: FontAwesomeIcons.percent),
      ],
    );
  }

  Row rowTextIcon(
      {required BuildContext context,
      required String text,
      required IconData icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: bodyTextColor,
          size: dsize(context) * 0.05,
        ),
        FittedBox(
            child: Text(
          text,
          style: const TextStyle(color: primaryColor),
        ))
      ],
    );
  }
}

Widget textFormField(
    String name, BuildContext context, IconData icon, RxString rxvalue) {
  return SizedBox(
    width: dWidth(context) * 0.3,
    child: TextFormField(
      onSaved: (value) {
        rxvalue.value = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter $name";
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: secondaryColor,
          ),
          contentPadding: EdgeInsets.only(
              top: dHeight(context) * 0.02,
              left: dWidth(context) * 0.008,
              right: dWidth(context) * 0.008),
          hintText: name,
          hintStyle: const TextStyle(color: bodyTextColor)),
      style: const TextStyle(
        color: primaryColor,
      ),
    ),
  );
}

Column navbar(PageControllers pageController, BuildContext context,
    ScrollController? _controller, AnimationControllers animationControllers) {
  return Column(
    children: [
      navIcon(
          color: whichColor[pageController.position.value == 0 ? 0 : 1],
          context: context,
          label: "About",
          icon: FontAwesomeIcons.userNinja,
          paController: pageController,
          controller: _controller!,
          pos: 0),
      navIcon(
          color: whichColor[pageController.position.value == 1 ? 0 : 1],
          context: context,
          label: "Education",
          icon: FontAwesomeIcons.graduationCap,
          check: true,
          controllers: animationControllers,
          controller: _controller,
          paController: pageController,
          pos: 1),
      navIcon(
          color: whichColor[pageController.position.value == 2 ? 0 : 1],
          context: context,
          label: "Skills",
          icon: FontAwesomeIcons.laptopCode,
          paController: pageController,
          controllers: animationControllers,
          controller: _controller,
          pos: 2),
      navIcon(
          color: whichColor[pageController.position.value == 3 ? 0 : 1],
          context: context,
          label: "Experience",
          icon: FontAwesomeIcons.building,
          paController: pageController,
          controllers: animationControllers,
          controller: _controller,
          pos: 3),
      navIcon(
          color: whichColor[pageController.position.value == 4 ? 0 : 1],
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
          color: whichColor[pageController.position.value == 6 ? 0 : 1],
          context: context,
          label: "Instagram",
          icon: FontAwesomeIcons.instagram,
          controller: _controller,
          paController: pageController,
          pos: 6),
      navIcon(
          color: whichColor[pageController.position.value == 7 ? 0 : 1],
          context: context,
          label: "Github",
          paController: pageController,
          icon: FontAwesomeIcons.github,
          controller: _controller,
          pos: 7),
      navIcon(
          color: whichColor[pageController.position.value == 8 ? 0 : 1],
          context: context,
          paController: pageController,
          label: "LinkedIn",
          icon: FontAwesomeIcons.linkedin,
          controller: _controller,
          pos: 8),
    ],
  );
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
          html.window.open("https://www.instagram.com/mr_aegon_01/", "_blank");
        }
        if (pos == 7) {
          html.window.open("https://github.com/Thiru-01", "_blank");
        }
        if (pos == 8) {
          html.window.open(
              "https://www.linkedin.com/in/thiru-candane-1067701b8/", "_blank");
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
