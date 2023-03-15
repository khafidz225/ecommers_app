import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  List<Shop>? shops = [];

  List<String> categoryList = [];
  final teststring = 'test'.obs;
  late final selectedCategory = ''.obs;
  // late final selectedCategory = ''.obs;
  late final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchShop();
  }

  Future<dynamic> fetchShop() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    var body = jsonDecode(response.body)['products'];

    if (response.statusCode == 200) {
      for (var shopsJson in body) {
        shops?.add(Shop.fromJson(shopsJson));
        // shops.add(Shop(id: id, title: title, description: description, price: price, rating: rating, category: category, thumbnail: thumbnail))
      }
      for (int i = 0; i < shops!.length; i++) {
        if (!categoryList.contains(shops![i].category)) {
          categoryList.add(shops![i].category);
        }
      }

      // for (var categoryJson in categoryBody) {
      // }

      print(shops?.map((e) => e.rating));
      print(categoryList);
      print(selectedCategory.value);
    } else {
      print('error');
    }
  }
}

class Shop {
  int id;
  String title;
  String description;
  int price;
  double rating;
  String category;
  String thumbnail;

  Shop(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.rating,
      required this.category,
      required this.thumbnail});

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        description: json['description'],
        rating: double.parse(json['rating'].toString()),
        price: int.parse(json['price'].toString()),
        thumbnail: json['thumbnail']);
  }
}
