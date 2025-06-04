import 'package:flutter/material.dart';
import '/components/common_app_bar.dart';
import '/components/common_drawer.dart';
import 'iPad_wallpaper_detail_page.dart';

class IPadWallpaperListPage extends StatelessWidget {
  final List<Map<String, String>> wallpapers = [
    {
      'title': 'コードギアス',
      'image': 'assets/sample1.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': 'ゴールデンタイム',
      'image': 'assets/sample1.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': 'ひぐらしのなく頃に',
      'image': 'assets/sample2.jpg',
      'description': 'iPadに最適な夜景デザイン。'
    },
    {
      'title': '薬屋のひとりごと',
      'image': 'assets/sample1.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': '<物語シリーズ>',
      'image': 'assets/sample2.jpg',
      'description': 'iPadに最適な夜景デザイン。'
    },
    {
      'title': 'STEINS;GATE',
      'image': 'assets/sample1.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': 'チ。-地球の運動について-',
      'image': 'assets/sample2.jpg',
      'description': 'iPadに最適な夜景デザイン。'
    },
    {
      'title': 'ようこそ実力至上主義の教室へ',
      'image': 'assets/sample1.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
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
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
          children: wallpapers.map((wallpaper) {
            return GestureDetector(
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
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        wallpaper['image']!,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        wallpaper['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        wallpaper['description']!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
