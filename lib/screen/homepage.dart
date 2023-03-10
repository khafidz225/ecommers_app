import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //Search
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        labelText: 'Search Here',
                        labelStyle: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500),
                        fillColor: Colors.grey[100],
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(0, 88, 88, 88)),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
              ),
            ),

            //Card Title
            Container(
              width: MediaQuery.of(context).size.width - 50,
              color: Color(0xffebe3da),
              // decoration: Decoration(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Left Text
                    Column(
                      children: [
                        Text('New'),
                        Text('Collection'),
                        TextButton(
                            onPressed: () => true, child: Text('Shop Now'))
                      ],
                    ),

                    //Right image
                    Text('Ini Image')
                  ],
                ),
              ),
            )
            //Categories

            //Filter Categories

            //Card Shopping
          ],
        ),
      ),
    );
  }
}
