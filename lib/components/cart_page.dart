import 'package:flutter/material.dart';

import 'purchase_page.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int get totalPrice =>
      widget.cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カート'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: widget.cartItems.isEmpty
          ? const Center(child: Text('カートは空です'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return ListTile(
                        leading: Image.asset(item.imagePath, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(item.title),
                        trailing: Text('${item.price}円'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('合計金額: $totalPrice 円',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PurchasePage(totalPrice: totalPrice),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('購入へ進む',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

// カート内アイテムのモデル例
class CartItem {
  final String title;
  final String imagePath;
  final int price;

  CartItem({
    required this.title,
    required this.imagePath,
    required this.price,
  });
}
