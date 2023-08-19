// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'dart:convert';

List<Test> testFromJson(String str) => List<Test>.from(json.decode(str).map((x) => Test.fromJson(x)));

String testToJson(List<Test> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Test {
  int id;
  String name;
  String description;
  int price;
  String image;
  int testCategoryId;

  Test({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.testCategoryId,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    image: json["image"],
    testCategoryId: json["test_category_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": image,
    "test_category_id": testCategoryId,
  };

}
