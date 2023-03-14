import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:madura_shop/screen/searchpage.dart';

class BasketController extends GetxController {
  var titles = ''.obs;
  RxList<Map<String, dynamic>> productList = <Map<String, dynamic>>[].obs;
  addProduct(String title, String thumbnail, int price) {
    // if (condition) {

    // }
    productList.add({'title': title, 'thumbnail': thumbnail, 'price': price});
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
