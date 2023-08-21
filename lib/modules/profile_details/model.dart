// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
List<Welcome> PackgeFromJsonQQ(List<dynamic> data) {
  return  data.map((e) {
    print(e);
    print('--------------------------------\n');

    return Welcome.fromJson(e);
  }).toList();
}
Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    UserInfo? userInfo;

    Welcome({
        required this.userInfo,
    });

    factory Welcome.fromJson(Map<dynamic, dynamic> json) => Welcome(
        userInfo: UserInfo.fromJson(json["User info"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "User info": userInfo?.toJson(),
    };
}

class UserInfo {
    int id;
    String firstName;
    String lastName;
    String phoneNumber;
    String email;
    String gender;
    DateTime birthDate;
    int age;
    int addressId;
    int accountType;
    dynamic createdAt;
    dynamic updatedAt;

    UserInfo({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.email,
        required this.gender,
        required this.birthDate,
        required this.age,
        required this.addressId,
        required this.accountType,
         this.createdAt,
         this.updatedAt,
    });

    factory UserInfo.fromJson(Map<dynamic, dynamic> json) => UserInfo(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birth_date"]),
        age: json["age"],
        addressId: json["address_id"],
        accountType: json["account_type"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "gender": gender,
        "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "age": age,
        "address_id": addressId,
        "account_type": accountType,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
