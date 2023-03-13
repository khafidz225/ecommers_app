import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:madura_shop/screen/detailpage.dart';

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

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Shop>? shops = [];
  List<String> categoryList = [];
  String _searchQuery = '';
  String? _selectedCategory;

  Future<void> fetchShop() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    var body = jsonDecode(response.body)['products'];
    // var categoryBody = jsonDecode(response.body)['products']['category'];
    // var testing = body

    if (response.statusCode == 200) {
      setState(() {
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
      });
      print(shops?.map((e) => e.rating));
      print(categoryList);
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                children: [
                  //--------------------------------//
                  //Search
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Center(
                      child: SizedBox(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value.toLowerCase();
                            });
                            print(_searchQuery);
                          },
                          decoration: InputDecoration(
                              filled: true,
                              prefixIcon:
                                  const Icon(Icons.search, color: Colors.black),
                              labelText: 'Search Here',
                              labelStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500),
                              fillColor: Colors.grey[100],
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.5),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(0, 88, 88, 88)),
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //---------------------------------------//
                  //Card Title
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffebe3da)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Left Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'New',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Collection',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              // ElevatedButton(
                              //     onPressed: () => true,
                              //     style:
                              //         ElevatedButton.styleFrom(primary: Colors.white),
                              //     child: Text(
                              //       'Shop Now',
                              //       style: TextStyle(color: Colors.black),
                              //     ))
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                  onPressed: () => true,
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.white),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 2),
                                    child: Text(
                                      'Shop Now',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ))
                            ],
                          ),

                          //Right image
                          Text('Ini Image')
                        ],
                      ),
                    ),
                  ),
                  //Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () => true, child: Text('View all'))
                    ],
                  ),
                  //------------------------------------//
                  //Filter Categories
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 45,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: categoryList.map(
                          (e) {
                            return SizedBox(
                              child: e == 'smartphones'
                                  ? Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: SizedBox(
                                            height: 45,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _selectedCategory = null;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      _selectedCategory == null
                                                          ? Colors.black
                                                          : Colors.white70),
                                              child: Text(
                                                'All',
                                                style: TextStyle(
                                                    color: _selectedCategory ==
                                                            null
                                                        ? Colors.white
                                                        : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: SizedBox(
                                            height: 45,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _selectedCategory = e;
                                                });
                                                print(_selectedCategory);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      _selectedCategory == e
                                                          ? Colors.black
                                                          : Colors.white70),
                                              child: Text(
                                                '${e[0].toUpperCase()}${e.substring(1).toLowerCase()}',
                                                style: TextStyle(
                                                    color:
                                                        _selectedCategory == e
                                                            ? Colors.white
                                                            : Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectedCategory = e;
                                          });
                                          print(_selectedCategory);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: _selectedCategory == e
                                                ? Colors.black
                                                : Colors.white70),
                                        child: Text(
                                          '${e[0].toUpperCase()}${e.substring(1).toLowerCase()}',
                                          style: TextStyle(
                                              color: _selectedCategory == e
                                                  ? Colors.white
                                                  : Colors.grey),
                                        ),
                                      )),
                            );
                          },
                        ).toList()),
                  ),
                  //-------------------------------------//
                  //Card
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      // shrinkWrap: true,
                      // crossAxisCount: 2,
                      spacing: 16,
                      runSpacing: 16,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: shops!
                          .where((element) =>
                              (_selectedCategory == null ||
                                  element.category == _selectedCategory) &&
                              (_searchQuery.isEmpty ||
                                  element.title
                                      .toLowerCase()
                                      .contains(_searchQuery)))
                          .map((e) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                  title: e.title,
                                                  description: e.description,
                                                  rating: e.rating,
                                                  thumbnail: e.thumbnail,
                                                  price: e.price,
                                                ),
                                              )),
                                          // style: ButtonStyle(
                                          //   backgroundColor:
                                          //       const MaterialStatePropertyAll(
                                          //           Colors.white),
                                          //   // shape: MaterialStatePropertyAll(
                                          //   //     RoundedRectangleBorder(
                                          //   //         borderRadius:
                                          //   //             BorderRadius.circular(
                                          //   //                 20)))
                                          // ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    e.thumbnail,
                                                    height: 150,
                                                    width: 200,
                                                  )),
                                              Text(
                                                e.title,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    '${e.price}',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )
                                                ],
                                              )
                                            ],
                                          )))
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
