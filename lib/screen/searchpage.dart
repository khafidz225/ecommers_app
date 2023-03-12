import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String category;

  const Product({
    required this.name,
    required this.price,
    required this.category,
  });
}

class Searchpage extends StatefulWidget {
  final List<Product> products;

  const Searchpage({required this.products});

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  String _searchQuery = '';
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategory = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        _selectedCategory == null ? Colors.green : Colors.grey,
                  ),
                  child: Text('All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategory = 'Electronics';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _selectedCategory == 'Electronics'
                        ? Colors.green
                        : Colors.grey,
                  ),
                  child: Text('Electronics'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategory = 'Clothing';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _selectedCategory == 'Clothing'
                        ? Colors.green
                        : Colors.grey,
                  ),
                  child: Text('Clothing'),
                ),
              ],
            ),
            Column(
              children: widget.products
                  .where((product) =>
                      (_selectedCategory == null ||
                          product.category == _selectedCategory) &&
                      (_searchQuery.isEmpty ||
                          product.name.toLowerCase().contains(_searchQuery)))
                  .map((product) {
                return Card(
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text('${product.price}'),
                    trailing: Text(product.category),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
