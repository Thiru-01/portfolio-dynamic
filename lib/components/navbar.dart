import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constant.dart';

AppBar deAppbar(context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

AppBar moAppbar(context, _sKey) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            _sKey.currentState.openDrawer();
          },
          child: Icon(
            FontAwesomeIcons.bars,
            size: mWidth(context) * 0.07,
          ),
        )),
  );
}
