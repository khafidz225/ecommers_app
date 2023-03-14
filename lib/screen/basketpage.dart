import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madura_shop/screen/searchpage.dart';

import '../controller/basketController.dart';

class Basketpage extends StatefulWidget {
  const Basketpage({super.key});

  @override
  State<Basketpage> createState() => _BasketpageState();
}

class _BasketpageState extends State<Basketpage> {
  var count = 0.obs();

  increment() {
    count++;
  }

  // var nametest = ''.obs;
  @override
  Widget build(BuildContext context) {
    final basketController = Get.put(BasketController());

    final fixProduct = basketController.productList
        .map((element) => jsonEncode(element))
        .toList();
    final jsonProduct = fixProduct.toSet().toList();
    final result = jsonProduct.map((e) => jsonDecode(e)).toList();
    print(jsonProduct);

    // var prices = 0.obs;
    // var totalPrices = prices

    RxList priceTotal = [].obs;
    testing(int countprice) {
      priceTotal.add(countprice);
      print(priceTotal);
    }

    // basketController.productList
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: SizedBox(
        height: 160,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            //Subtotal
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Subtotal'), Text('\$ 632638712')],
              ),
            ),
            //Delivery
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Delivery'), Text('\$ 632638712')],
              ),
            ),
            //Total
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Color(0xffb1b3b1)))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Total'), Text('\$ 632638712')],
                ),
              ),
            ),
            //Button Checkout
            TextButton(
                onPressed: () => true,
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                      child: Text(
                        'Shop Now',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 55,
              ),

              //Appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () => true,
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 30,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //Delivery Destination
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 25,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.grey[400],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery To',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Missouri, Canton, 285 W Peace St',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        TextButton(onPressed: () => true, child: Text('Edit'))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //ListView Order
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: 200,
                  child: Column(
                    children: List.generate(result.length, (index) {
                      var count = 1.obs;

                      void addCount() {
                        count++;
                        testing(count.toInt());

                        print('test');
                      }

                      removeCount() {
                        if (count > 1) {
                          count - 1;
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: ListTile(
                          // ba
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              result[index]['thumbnail'],
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                result[index]['title'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                '\$ ${result[index]['price']}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          trailing: SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                SizedBox(
                                  child: IconButton(
                                      onPressed: () => removeCount(),
                                      icon: Icon(
                                        Icons.remove,
                                      )),
                                ),
                                Obx(() => Text(
                                      '${count}',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                IconButton(
                                    onPressed: () => addCount(),
                                    icon: Icon(
                                      Icons.add,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  )),
              // Row(
              //   children: [
              //     Text('$count'),
              //   ],
              // )
            ],
          ),
        ),
      ),
      // body: Center(
      //   child:
      // ),
    );
  }
}

// Text(result[index]['title'])