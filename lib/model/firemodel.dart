// To parse this JSON data, do
//
//     final fireModel = fireModelFromJson(jsonString);

import 'dart:convert';

FireModel fireModelFromJson(String str) => FireModel.fromJson(json.decode(str));

String fireModelToJson(FireModel data) => json.encode(data.toJson());

class FireModel {
  FireModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.fstoragePath,
    required this.github,
  });

  String title;
  String subtitle;
  String description;
  String fstoragePath;
  String github;

  factory FireModel.fromJson(json) => FireModel(
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        fstoragePath: json["FstoragePath"],
        github: json["github"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "FstoragePath": fstoragePath,
        "github": github,
      };
}
