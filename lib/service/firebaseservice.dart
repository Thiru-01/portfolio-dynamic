// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/model/firemodel.dart';

class FirebasePortService {
  final Reference _firebaseStorage =
      FirebaseStorage.instance.ref().child("/projecImages/");
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("projectHistory");

  Stream<QuerySnapshot> getProject() {
    return _firebaseFirestore.snapshots();
  }

  uploadImage(
      FireModel data, FilePickerResult image, BuildContext context) async {
    bool value = false;
    await _firebaseFirestore
        .add(data.toJson())
        .whenComplete(() => value = true);
    UploadTask task = _firebaseStorage
        .child(image.files[0].name)
        .putData(image.files[0].bytes!);
    task.whenComplete(() {
      value = true;
    });
    if (value) {
      Navigator.pop(context);
    }
    return value;
  }

  Future<String> urlStorage(String name) async {
    String url = await _firebaseStorage
        .child(name.split("/projecImages/")[1])
        .getDownloadURL();
    return url;
  }
}

Future<String> getInfo() async {
  String url = "https://portfolio-310ae-default-rtdb.firebaseio.com/.json";
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return response.body;
  }
  return "";
}
