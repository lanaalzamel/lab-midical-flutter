class user_info {
  UserInfo? userInfo;

  user_info({this.userInfo});

  user_info.fromJson(Map<dynamic, dynamic> json) {
    userInfo = json['User info'] != null
        ? new UserInfo.fromJson(json['User info'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.userInfo != null) {
      data['User info'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? gender;
  String? birthDate;
  int? age;
  int? addressId;
  int? accountType;
  Null createdAt;
  Null updatedAt;

  UserInfo(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.gender,
        this.birthDate,
        this.age,
        this.addressId,
        this.accountType,
        this.createdAt,
        this.updatedAt});

  UserInfo.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    age = json['age'];
    addressId = json['address_id'];
    accountType = json['account_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['age'] = this.age;
    data['address_id'] = this.addressId;
    data['account_type'] = this.accountType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}