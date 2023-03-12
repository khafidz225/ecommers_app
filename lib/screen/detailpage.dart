import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.title,
      required this.thumbnail,
      required this.rating,
      required this.description});
  final String title;
  final String thumbnail;
  final double rating;
  final String description;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
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
