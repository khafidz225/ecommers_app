import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem {
  final String name;
  RxInt quantity;

  CartItem({required this.name, int? quantity})
      : quantity = RxInt(quantity ?? 0);

  double get totalPrice => quantity.value * 10.0;
}

class Cart extends GetxController {
  RxList<CartItem> _items = RxList<CartItem>([]);

  List<CartItem> get items => _items;

  double get totalPrice =>
      _items.fold(0, (total, item) => total + item.totalPrice);

  void addItem(String itemName) {
    bool itemFound = false;
    for (var item in _items) {
      if (item.name == itemName) {
        itemFound = true;
        item.quantity.value++;
      }
    }
    if (!itemFound) {
      _items.add(CartItem(name: itemName, quantity: 1));
    }
  }

  void removeItem(String itemName) {
    for (var item in _items) {
      if (item.name == itemName) {
        if (item.quantity.value > 1) {
          item.quantity.value--;
        } else {
          _items.remove(item);
        }
        break;
      }
    }
  }

  void clearCart() {
    _items = RxList<CartItem>([]);
  }
}

class Favoritepage extends StatelessWidget {
  final Cart cart = Get.put(Cart());

  @override
  Widget build(BuildContext context) {
    cart.addItem('kaos');
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${cart.items[index].name} x ${cart.items[index].quantity}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () =>
                                cart.removeItem(cart.items[index].name),
                            icon: Icon(Icons.remove),
                          ),
                          Obx(
                            () => Text(
                              '${cart.items[index].quantity}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                cart.addItem(cart.items[index].name),
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Obx(
              () => Text(
                'Total price: \$${cart.totalPrice}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
