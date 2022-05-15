import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/pages/desktop/dhomepage.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),
        () => Get.off(() => const DesktopScreen(),
            transition: Transition.downToUp));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "the profile is".toUpperCase(),
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 30.0 * text(context),
                  letterSpacing: 3),
            ),
            SizedBox(
              height: dHeight(context) * 0.05,
            ),
            SizedBox(
              height: dHeight(context) * 0.01,
              width: dWidth(context) * 0.4,
              child: LinearProgressIndicator(
                  backgroundColor: darkColor,
                  color: primaryColor,
                  minHeight: dHeight(context) * 0.02),
            ),
            SizedBox(
              height: dHeight(context) * 0.05,
            ),
            Text(
              "loading...".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 25.0 * text(context),
                  letterSpacing: 3),
            ),
          ],
        ),
      ),
    );
  }
}
