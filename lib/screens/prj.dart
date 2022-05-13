import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/model/firemodel.dart';
import 'package:portfolio/service/firebaseService.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebasePortService firebasePortService = FirebasePortService();
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("projectHistory").snapshots(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Wrap(
                alignment: data.data!.docs.length <= 2
                    ? WrapAlignment.start
                    : WrapAlignment.spaceBetween,
                runSpacing: dHeight(context) * 0.01,
                children: [
                  for (int i = 0; i < data.data!.docs.length; i++)
                    cardContainer(context, firebasePortService, i, data)
                ],
              ),
            ),
          );
        });
  }

  Padding cardContainer(BuildContext context,
      FirebasePortService firebasePortService, int index, data) {
    DocumentSnapshot d = data.data!.docs[index];
    FireModel fireModel = FireModel.fromJson(d);
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0, top: 20),
      child: Container(
        height: dHeight(context) * 0.5,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<String>(
                future: firebasePortService.urlStorage(fireModel.fstoragePath),
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                        child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: CircularProgressIndicator(),
                    ));
                  }
                  return data.data != null
                      ? Container(
                          height: dHeight(context) * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: Image.network(
                                  data.data!,
                                  width: double.infinity,
                                ).image),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                        )
                      : Container();
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text(
                  fireModel.title.toUpperCase(),
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: 15.0 * text(context)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                fireModel.description,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          primary: Colors.black,
                          minimumSize: const Size(40, 40)),
                      onPressed: () =>
                          html.window.open(fireModel.github, "_blank"),
                      child: Row(
                        children: const [
                          Text(
                            "Source Code",
                            style: TextStyle(
                                color: bgColor, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(FontAwesomeIcons.github, color: bgColor)
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
