// To parse this JSON data, do
//
//     final lab = labFromJson(jsonString);

import 'dart:convert';

Lab labFromJson(String str) => Lab.fromJson(json.decode(str));

String labToJson(Lab data) => json.encode(data.toJson());

class Lab {
  int ?id;
  String ?name;
  int ?addressId;
  int ?phoneNumber;
  String ?certificate;
  int ?rate;
  String? image;
  String ?workHours;

  Lab({
     this.id,
     this.name,
     this.addressId,
     this.phoneNumber,
     this.certificate,
     this.rate,
     this.image,
     this.workHours,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
    id: json["id"] as int? ?? 0,
    name: json["name"] as String? ?? '',
    addressId: json["address_id"] as int? ?? 0,
    phoneNumber: json["phone_number"] as int? ?? 0,
    certificate: json["certificate"] as String? ?? '',
    rate: json["rate"] as int? ?? 0,
    image: json["image"] as String? ?? '',
    workHours: json["work_hours"] as String? ?? '',
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address_id": addressId,
    "phone_number": phoneNumber,
    "certificate": certificate,
    "rate": rate,
    "image": image,
    "work_hours": workHours,
  };
}
