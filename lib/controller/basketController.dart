import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:madura_shop/controller/api_controller.dart';
import 'package:madura_shop/navigation_bar.dart';
import 'package:madura_shop/screen/searchpage.dart';

class BasketController extends GetxController {
  RxList<Map<String, dynamic>> productList = <Map<String, dynamic>>[].obs;
  addProduct(int id, String title, String thumbnail, int price) {
    productList.add(
        {'id': id, 'title': title, 'thumbnail': thumbnail, 'price': price});
    print(productList.length);
  }

  var itemsProduct = {}.obs;

  addItemsProduct(dynamic shop) {
    if (itemsProduct.containsKey(shop)) {
      itemsProduct[shop] += 1;
    } else {
      itemsProduct[shop] = 1;
    }

    // Get.snackbar('Berhasil', 'Horeee');
    print(itemsProduct);
  }

  removeItemsProduct(dynamic shop) {
    if (itemsProduct.containsKey(shop)) {
      itemsProduct[shop] -= 1;
    } else {
      itemsProduct[shop] = 1;
    }

    print(itemsProduct);
  }
}



// class KeranjangController extends GetxController {
//   var totalHarga = 0.obs;
//   var testProduct = ''.obs;

//   tambahProduk(String productName, int price) {
//     totalHarga += price;
//     testProduct = productName as RxString;
//   }

//   hapusSemuaProduk() {
//     totalHarga.value = 0;
//   }
// }
