import 'package:flutter/material.dart';
import 'package:portfolio/pages/desktop/dhomepage.dart';

import 'package:portfolio/pages/mobile/mhomepage.dart';

class ResBuilder extends StatelessWidget {
  const ResBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 400) {
          return const MobileScreen();
        } else {
          return const DesktopScreen();
        }
      },
    );
  }
}
