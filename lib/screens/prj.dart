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
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10.0),
            itemCount: data.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot d = data.data!.docs[index];
              FireModel fireModel = FireModel.fromJson(d);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                  padding: EdgeInsets.all(dWidth(context) * 0.01),
                  child: Column(
                    children: [
                      Text(
                        fireModel.title,
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 15.0 * text(context)),
                      ),
                      FutureBuilder<String>(
                          future: firebasePortService
                              .urlStorage(fireModel.fstoragePath),
                          builder: (context, data) {
                            if (data.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                  height: dHeight(context) * 0.01,
                                  width: dWidth(context) * 0.01,
                                  child: const CircularProgressIndicator());
                            }
                            return Image.network(data.data!);
                          })
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
