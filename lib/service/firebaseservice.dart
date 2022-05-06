import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:portfolio/model/firemodel.dart';

class FirebasePortService {
  final Reference _firebaseStorage =
      FirebaseStorage.instance.ref().child("/projecImages/");
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("projectHistory");

  Stream<QuerySnapshot> getProject() {
    return _firebaseFirestore.snapshots();
  }

  uploadImage(FireModel data, FilePickerResult image) async {
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
    return value;
  }

  Future<String> urlStorage(String name) async {
    String url = await _firebaseStorage
        .child(name.split("/projecImages/")[1])
        .getDownloadURL();

    return url;
  }
}
