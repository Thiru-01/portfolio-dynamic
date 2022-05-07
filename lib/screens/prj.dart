import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constant.dart';
import 'package:portfolio/model/firemodel.dart';
import 'package:portfolio/service/firebaseService.dart';

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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: data.data!.docs.length,
              mainAxisSpacing: 40,
              crossAxisSpacing: 24,
              childAspectRatio: 0.75,
            ),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10.0),
            itemCount: data.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot d = data.data!.docs[index];
              FireModel fireModel = FireModel.fromJson(d);
              return cardContainer(context, fireModel, firebasePortService);
            },
          );
        });
  }

  Padding cardContainer(BuildContext context, FireModel fireModel,
      FirebasePortService firebasePortService) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: dHeight(context) * 0.4,
        width: dWidth(context) * 0.1,
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
          children: [
            FutureBuilder<String>(
                future: firebasePortService.urlStorage(fireModel.fstoragePath),
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                        height: dHeight(context) * 0.05,
                        width: dWidth(context) * 0.01,
                        child: const CircularProgressIndicator());
                  }
                  return data.data != null
                      ? Container(
                          height: dHeight(context) * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.network(
                              data.data!,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ).image),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                        )
                      : Container();
                }),
            Text(
              fireModel.title,
              style: TextStyle(
                  color: secondaryColor, fontSize: 15.0 * text(context)),
            ),
          ],
        ),
      ),
    );
  }
}
