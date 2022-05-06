import 'package:flutter/material.dart';
import 'package:portfolio/components/navbar.dart';
import 'package:portfolio/constant.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey _scaffoldKey = GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
      appBar: moAppbar(context, _scaffoldKey),
      drawer: SizedBox(
        width: mWidth(context) * 0.7,
        child: Drawer(
          elevation: 1,
          child: ListView(
            children: const [],
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
              child: Container(
            color: Colors.red,
          )),
          Expanded(
              child: Container(
            color: Colors.red,
          ))
        ],
      ),
    );
  }
}
