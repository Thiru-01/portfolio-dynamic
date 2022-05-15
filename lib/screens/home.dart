import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:colored_json/colored_json.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/controller/mailcontroller.dart';
import 'package:portfolio/controller/pagecontroller.dart';
import 'package:portfolio/screens/form.dart';
import 'package:portfolio/service/firebaseService.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController controller;
  final PageControllers pageControllers;
  const HomeScreen(
      {Key? key, required this.controller, required this.pageControllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey formKey = GlobalKey<FormState>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: dWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: dWidth(context) * 0.095,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    radius: dWidth(context) * 0.09,
                    backgroundImage: const AssetImage('assets/img/1.jpg'),
                  ),
                ),
                FittedBox(
                  child: Column(
                    children: [
                      Text(
                        "THIRUMURUGAN",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 7,
                            fontSize: 32.0 * text(context)),
                      ),
                      Text(
                        "Mobile App Developer, AI Kid \n Full Stack Developer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 4,
                            height: 1.5,
                            fontSize: 15.0 * text(context)),
                      )
                    ],
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => showMailDialog(context, formKey),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: primaryColor,
                              width: dsize(context) * 0.003)),
                      width: dWidth(context) * 0.2,
                      height: dHeight(context) * 0.06,
                      child: Center(
                          child: Text(
                        "Contact".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
            height: dHeight(context),
            width: (dWidth(context) - dWidth(context) * 0.05) / 2,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: FutureBuilder<String>(
                    future: getInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: secondaryColor,
                        ));
                      }
                      return ColoredJson(
                        data: snapshot.data!,
                        backgroundColor: Colors.transparent,
                        colonColor: primaryColor,
                        commaColor: Colors.white,
                        curlyBracketColor: Colors.white,
                        squareBracketColor: Colors.white,
                        keyColor: primaryColor,
                        boolColor: bodyTextColor,
                        textStyle: TextStyle(
                            height: 1.6,
                            fontFamily: GoogleFonts.sourceCodePro().fontFamily,
                            fontSize: dsize(context) * 0.03,
                            fontWeight: FontWeight.bold),
                        indentLength: 10,
                        stringColor: bodyTextColor,
                      );
                    }),
              ),
            ))
      ],
    );
  }
}

showMailDialog(BuildContext context, formKey) {
  MainController controller = Get.put(MainController());
  AlertDialog alert = AlertDialog(
    backgroundColor: bgColor,
    buttonPadding: const EdgeInsets.all(12),
    actions: [
      TextButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              showLoaderDialog(context, "Sending");
              const serviceId = "service_q0817kj";
              const tempId = "template_nuxw6jp";
              const userId = "a8gOlMXe3yp8oPwME";
              Uri url =
                  Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
              final res = await http.post(url,
                  headers: {'Content-Type': 'application/json'},
                  body: json.encode({
                    'service_id': serviceId,
                    'template_id': tempId,
                    'user_id': userId,
                    'template_params': {
                      'from_name': controller.name.value,
                      'message': controller.msg.value,
                      'id': controller.email.value
                    }
                  }));
              if (res.statusCode == 200) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            }
          },
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(3.0))),
          child: const Text("Send"))
    ],
    content: SizedBox(
        height: dHeight(context) * 0.4,
        width: dWidth(context) * 0.4,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              formField(
                  context: context,
                  rxvalue: controller.name,
                  name: "Name",
                  icon: FontAwesomeIcons.user),
              formField(
                  context: context,
                  rxvalue: controller.email,
                  name: "Email Id",
                  icon: FontAwesomeIcons.envelope),
              TextFormField(
                style: const TextStyle(color: primaryColor),
                onSaved: (value) {
                  controller.msg.value = value!;
                },
                validator: (value) {
                  if (value == null || value == "") {
                    return "Message";
                  }
                  return null;
                },
                maxLines: 3,
                decoration: const InputDecoration(
                    hintText: "Message",
                    hintStyle: TextStyle(color: bodyTextColor)),
              ),
            ],
          ),
        )),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget formField(
    {required BuildContext context,
    required RxString rxvalue,
    required String name,
    required IconData icon}) {
  return TextFormField(
    onSaved: (value) {
      rxvalue.value = value!;
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "Please Enter $name";
      }
      if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(value) &&
          value.isNotEmpty &&
          name == "Email Id") {
        return "Please enter valid $name";
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
  );
}
