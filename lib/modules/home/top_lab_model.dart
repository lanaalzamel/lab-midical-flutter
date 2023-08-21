class TopLab {
  int? id;
  String? name;
  int? addressId;
  int? phoneNumber;
  int? userId;
  String? certificate;
  String? image;
  String? stamp;
  String? openHour;
  String? closeHour;
  List<String>? workDays;
  dynamic averageRate;
  List<Null>? rates;

  TopLab(
      {this.id,
      this.name,
      this.addressId,
      this.phoneNumber,
      this.userId,
      this.certificate,
      this.image,
      this.stamp,
      this.openHour,
      this.closeHour,
      this.workDays,
      this.averageRate,
      this.rates});

  TopLab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addressId = json['address_id'];
    phoneNumber = json['phone_number'];
    userId = json['user_id'];
    certificate = json['certificate'];
    image = json['image'];
    stamp = json['stamp'];
    openHour = json['open_hour'];
    closeHour = json['close_hour'];
    workDays = json['work_days'].cast<String>();
    averageRate = json['averageRate'];
    // if (json['rates'] != null) {
    //   rates = <Null>[];
    //   json['rates'].forEach((v) {
    //     rates?.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address_id'] = addressId;
    data['phone_number'] = phoneNumber;
    data['user_id'] = userId;
    data['certificate'] = certificate;
    data['image'] = image;
    data['stamp'] = stamp;
    data['open_hour'] = openHour;
    data['close_hour'] = closeHour;
    data['work_days'] = workDays;
    data['averageRate'] = averageRate;
    // if (rates != null) {
    //   data['rates'] = rates?.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
