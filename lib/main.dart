import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/responsive/resbuilder.dart';
import 'package:portfolio/screens/form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDBXtdGnexRJM567gkk8IZjdT7JG6EnbOM",
          authDomain: "portfolio-310ae.firebaseapp.com",
          databaseURL: "https://portfolio-310ae-default-rtdb.firebaseio.com",
          projectId: "portfolio-310ae",
          storageBucket: "portfolio-310ae.appspot.com",
          messagingSenderId: "733389100645",
          appId: "1:733389100645:web:5a57fc0dc491d64ac2188c",
          measurementId: "G-EX612HFKWG"));

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
        GetPage(name: "/", page: () => const ResBuilder())
      ],
    );
  }
}
