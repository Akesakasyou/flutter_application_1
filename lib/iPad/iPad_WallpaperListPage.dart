import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/wallpaper_model.dart';
import '../screens/cart_page.dart';
import '../screens/model/wallpaper_model.dart';
import '../screens/screens/cart_page.dart';
import '../screens/screens/wallpaper_detail_page.dart';
import '../screens/provider/cart_provider.dart';

class iPadWallpaperListPage extends StatelessWidget {
  final List<Wallpaper> wallpapers = [
    Wallpaper(
      title: 'iPad 壁紙 1',
      imageUrl: 'https://example.com/ipad1.jpg',
      description: '美しいiPad壁紙その1',
    ),
    Wallpaper(
      title: 'iPad 壁紙 2',
      imageUrl: 'https://example.com/ipad2.jpg',
      description: '美しいiPad壁紙その2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iPad壁紙一覧'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: wallpapers.length,
        itemBuilder: (context, index) {
          final wallpaper = wallpapers[index];
          return ListTile(
            leading: Image.network(wallpaper.imageUrl, width: 80),
            title: Text(wallpaper.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WallpaperDetailPage(wallpaper: wallpaper),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
