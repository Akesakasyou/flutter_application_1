import 'package:flutter/material.dart';
import '/components/common_app_bar.dart';
import '/components/common_drawer.dart';
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
        title: const Text('iPad 壁紙'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Row(
          children: wallpapers.map((wallpaper) {
            return Expanded(
              child: GestureDetector(
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
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          wallpaper['image']!,
                          height: 300,  // 画像高さを300に増やし縦長に
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),  // 上下のパディングを増加
                        child: Text(
                          wallpaper['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
