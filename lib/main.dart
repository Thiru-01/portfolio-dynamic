import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/responsive/resbuilder.dart';
import 'package:portfolio/screens/form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Thiru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primaryswatch,
          scaffoldBackgroundColor: bgColor,
          canvasColor: bgColor,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: bodyTextColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: const BorderSide(width: 2))),
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: primaryColor)),
          fontFamily: GoogleFonts.sourceCodePro().fontFamily,
          textTheme:
              GoogleFonts.sourceCodeProTextTheme(Theme.of(context).textTheme)
                  .apply(bodyColor: Colors.white)
                  .copyWith(
                      bodyText1: const TextStyle(color: bodyTextColor),
                      bodyText2: const TextStyle(color: bodyTextColor))),
      home: const ResBuilder(),
      getPages: [
        GetPage(name: "/update", page: () => const FormUpdate()),
      ],
    );
  }
}
