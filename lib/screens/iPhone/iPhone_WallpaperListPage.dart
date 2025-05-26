import 'package:flutter/material.dart';
import 'iPhone_wallpaper_detail_page.dart';

class IPhoneWallpaperListPage extends StatelessWidget {
  final List<Map<String, String>> wallpapers = [
    {
      'title': '夕焼けの海',
      'image': 'assets/sample1.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。'
    },
    {
      'title': '宇宙空間',
      'image': 'assets/sample2.jpg',
      'description': 'iPhone向けの宇宙デザイン。'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iPhone 壁紙'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: wallpapers.length,
        itemBuilder: (context, index) {
          final wallpaper = wallpapers[index];
          return ListTile(
            leading: Image.asset(wallpaper['image']!, width: 60, height: 60, fit: BoxFit.cover),
            title: Text(wallpaper['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WallpaperDetailPage(
                    title: wallpaper['title']!,
                    imagePath: wallpaper['image']!,
                    description: wallpaper['description']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
