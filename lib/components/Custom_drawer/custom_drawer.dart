import 'package:flutter/material.dart';
import 'support.dart'; // ← ContactPage をインポート（パスは調整してください）

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'メニュー',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
         
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('カート'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('マイページ'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('お問い合わせ'),
            onTap: () {
              Navigator.pop(context); // Drawer を閉じる
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
