// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<Categoryoftest> categoryFromJson(String str) => List<Categoryoftest>.from(json.decode(str).map((x) => Categoryoftest.fromJson(x)));

String categoryToJson(List<Categoryoftest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoryoftest {
  int id;
  String name;
  String description;
  String image;

  Categoryoftest({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Categoryoftest.fromJson(Map<String, dynamic> json) => Categoryoftest(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}
