import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madura_shop/controller/basketController.dart';
import 'package:madura_shop/navigation_bar.dart';
import 'package:madura_shop/screen/basketpage.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.id,
      required this.title,
      required this.thumbnail,
      required this.rating,
      required this.description,
      required this.price});
  final int id;
  final String title;
  final String thumbnail;
  final double rating;
  final int price;
  final String description;
  @override
  State<DetailPage> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final basketController = Get.put(BasketController());
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ ${widget.price}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () {
                  basketController.addProduct(
                      widget.id, widget.title, widget.thumbnail, widget.price);
                  // print(basketController.Title.value);
                  Get.to(() => screens()[2]);
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ))
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 55,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  )),
              Text(
                'Product Detail',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () => true,
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(widget.thumbnail))),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title Product
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[400],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(widget.rating.toString()),
                      const SizedBox(
                        width: 2,
                      ),
                      Text('(102)')
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Description
                  Text(widget.description)
                  //
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
