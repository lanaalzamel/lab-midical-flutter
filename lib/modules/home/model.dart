// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Welcome> PackgeFromJsonQQ(List<dynamic> data) {
  return List<Welcome>.from(data.map((e) {
    print(e);
    print('--------------------------------\n');

    return Welcome.fromJson(e);
  }).toList());
}

class Welcome {
  int id;
  String name;
  int addressId;
  int phoneNumber;
  int userId;
  String certificate;
  String image;
  String stamp;
  String openHour;
  String closeHour;
  List<String> workDays;
  dynamic averageRate;
  List<dynamic> rates;

  Welcome({
    required this.id,
    required this.name,
    required this.addressId,
    required this.phoneNumber,
    required this.userId,
    required this.certificate,
    required this.image,
    required this.stamp,
    required this.openHour,
    required this.closeHour,
    required this.workDays,
    required this.averageRate,
    required this.rates,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        addressId: json["address_id"],
        phoneNumber: json["phone_number"],
        userId: json["user_id"],
        certificate: json["certificate"],
        image: json["image"],
        stamp: json["stamp"],
        openHour: json["open_hour"],
        closeHour: json["close_hour"],
        workDays: List<String>.from(json["work_days"].map((x) => x)),
        averageRate: json["averageRate"],
        rates: List<dynamic>.from(json["rates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address_id": addressId,
        "phone_number": phoneNumber,
        "user_id": userId,
        "certificate": certificate,
        "image": image,
        "stamp": stamp,
        "open_hour": openHour,
        "close_hour": closeHour,
        "work_days": List<dynamic>.from(workDays.map((x) => x)),
        "averageRate": averageRate,
        "rates": List<dynamic>.from(rates.map((x) => x)),
      };
}
