import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/components.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/animationcontroller.dart';

class EducationPage extends StatelessWidget {
  final AnimationControllers controller;
  const EducationPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(dWidth(context) * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Stack(
            children: [
              Obx(() => AnimatedPositioned(
                    top: controller.c3.value * dHeight(context),
                    curve: Curves.easeOutCubic,
                    duration: const Duration(milliseconds: 600),
                    child: const CustomCard(
                      eduData: "Secondary Education",
                      detials:
                          "I completed my Secondary(10th) in Immaculate Heart of Mary Hr. Sec. School, Puducherry under the state board of Tamilnadu. I have come up with a good percentage in first class without any backlogs.",
                      location: "Puducherry",
                      percent: "88.8",
                    ),
                  ))
            ],
          )),
          Expanded(
              child: Stack(
            children: const [
              CustomCard(
                eduData: "Higher Secondary Education",
                detials:
                    "I completed my Higher Secondary(12th) in Presidency Higher Secondary School, Puducherry under the state board of Tamilnadu. I have come up with a good percentage in first class without any backlogs.",
                location: "Puducherry",
                percent: "78",
              )
            ],
          )),
          Expanded(
              child: Stack(
            children: [
              Obx(() => AnimatedPositioned(
                  bottom: dHeight(context) * controller.c3.value,
                  curve: Curves.easeOutCubic,
                  duration: const Duration(milliseconds: 600),
                  child: const CustomCard(
                    eduData: "Higher Secondary Education",
                    detials:
                        "I have been pursuing my BTech(Computer Science and Engineering) in Manakula Vinayagar Institute of Technology, Puducherry. To speak from experience, as a Computer Science Student, I have gained experience in implementing projects and internships as well.",
                    location: "Puducherry",
                    percent: "8.0",
                  )))
            ],
          )),
        ],
      ),
    );
  }
}
