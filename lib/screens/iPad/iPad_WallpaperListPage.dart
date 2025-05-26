import 'package:flutter/material.dart';
import 'iPad_wallpaper_detail_page.dart';

class IPadWallpaperListPage extends StatelessWidget {
  final List<Map<String, String>> wallpapers = [
    {
      'title': '緑の森',
      'image': 'assets/sample1.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': '夜の街並み',
      'image': 'assets/sample2.jpg',
      'description': 'iPadに最適な夜景デザイン。'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iPad 壁紙'),
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
