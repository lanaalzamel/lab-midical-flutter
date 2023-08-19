import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:labapp/model/test_model.dart';
import 'package:labapp/modules/test_details/test_details.dart';

class DetailController extends GetxController {
  final items = <TestDetailed>[].obs;
  final _storage = GetStorage();

  void addItem(TestDetailed item) {
    items.add(item);
  }
  var name = ''.obs;

  var image = ''.obs;
  var price = ''.obs;
  var description = ''.obs;

  // Method to update the data
  void updateData(String name,  String image, String price, String description) {
    this.name.value = name;

    this.image.value = image;
    this.price.value = price;
    this.description.value = description;
    _storage.write('name', name);
    _storage.write('image', image);
    _storage.write('price', price);
    _storage.write('description', description);
  }

  DetailController() {
    // Restore data from GetStorage on initialization
    name.value = _storage.read('name') ?? '';
    image.value = _storage.read('image') ?? '';
    price.value = _storage.read('price') ?? '';
    description.value = _storage.read('description') ?? '';
  }

  }
