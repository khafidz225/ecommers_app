//------------------DetailPage------------------//

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DetailPage extends StatelessWidget {
//   final String productName;
//   final int price;

//   DetailPage({required this.productName, required this.price});

//   @override
//   Widget build(BuildContext context) {
//     final keranjangController = Get.put(KeranjangController());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Product Name: $productName'),
//             Text('Price: $price'),
//             ElevatedButton(
//               onPressed: () {
//                 keranjangController.tambahProduk(productName, price);
//                 Get.to(() => KeranjangPage());
//               },
//               child: Text('Tambah ke Keranjang'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//--------------------KeranjangPage----------------------//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:your_app_name/controllers/keranjang_controller.dart';

// class KeranjangPage extends StatelessWidget {
//   final keranjangController = Get.put(KeranjangController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Keranjang'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text('Total Harga: ${keranjangController.totalHarga.value}')),
//             ElevatedButton(
//               onPressed: () {
//                 keranjangController.hapusSemuaProduk();
//               },
//               child: Text('Hapus Semua Produk'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//-----------------KeranjangController------------//
// import 'package:get/get.dart';

// class KeranjangController extends GetxController {
//   var totalHarga = 0.obs;

//   tambahProduk(String productName, int price) {
//     totalHarga += price;
//   }

//   hapusSemuaProduk() {
//     totalHarga.value = 0;
//   }
// }

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestGetx extends StatelessWidget {
  const TestGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
