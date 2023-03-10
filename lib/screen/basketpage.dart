import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Basketpage extends StatefulWidget {
  const Basketpage({super.key});

  @override
  State<Basketpage> createState() => _BasketpageState();
}

class _BasketpageState extends State<Basketpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('basket'),
    );
  }
}
