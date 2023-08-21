class Appointments {
  int? id;
  int? userId;
  int? labId;
  String? date;
  String? hour;
  int? totalPrice;
  dynamic createdAt;
  dynamic updatedAt;
  List<Tests>? tests;

  Appointments(
      {this.id,
      this.userId,
      this.labId,
      this.date,
      this.hour,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.tests});

  Appointments.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    labId = json['lab_id'];
    date = json['date'];
    hour = json['hour'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tests'] != null) {
      tests = <Tests>[];
      json['tests'].forEach((v) {
        tests?.add(Tests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['lab_id'] = labId;
    data['date'] = date;
    data['hour'] = hour;
    data['total_price'] = totalPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (tests != null) {
      data['tests'] = tests?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tests {
  int? id;
  String? name;
  String? description;
  int? price;
  String? image;
  int? testCategoryId;
  Pivot? pivot;

  Tests(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.testCategoryId,
      this.pivot});

  Tests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    testCategoryId = json['test_category_id'];
    pivot = json['pivot'] != null ? Pivot?.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['test_category_id'] = testCategoryId;
    if (pivot != null) {
      data['pivot'] = pivot?.toJson();
    }
    return data;
  }
}

class Pivot {
  int? appointmentsId;
  int? testsId;

  Pivot({this.appointmentsId, this.testsId});

  Pivot.fromJson(Map<String, dynamic> json) {
    appointmentsId = json['appointments_id'];
    testsId = json['tests_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['appointments_id'] = appointmentsId;
    data['tests_id'] = testsId;
    return data;
  }
}
