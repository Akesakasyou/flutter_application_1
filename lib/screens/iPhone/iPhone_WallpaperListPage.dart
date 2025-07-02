import 'package:flutter/material.dart';
import 'iPhone_wallpaper_detail_page.dart'; // スマホ用の詳細ページを想定

class IPhoneWallpaperListPage extends StatelessWidget {
  final List<Map<String, String>> wallpapers = [
    {
      'title': 'コードギアス',
      'image': 'assets/images/smartphone/STEINS;GATE.jpg',
      'description': 'iPhone向けの癒し系壁紙です。',
    },
    {
      'title': 'ゴールデンタイム',
      'image': 'assets/images/smartphone/monogatari.jpg',
      'description': 'iPhone向けの癒し系壁紙です。',
    },
    {
      'title': 'ひぐらしのなく頃に',
      'image': 'assets/images/smartphone/kusuriya[.jpg',
      'description': 'iPhoneに最適な夜景デザイン。',
    },
    {
      'title': '薬屋のひとりごと',
      'image': 'assets/images/smartphone/houseki.jpg',
      'description': 'iPhone向けの癒し系壁紙です。',
    },
    {
      'title': '<物語シリーズ>',
      'image': 'assets/images/smartphone/Bloom into you.jpg',
      'description': 'iPhoneに最適な夜景デザイン。',
    },
    {
      'title': 'STEINS;GATE',
      'image': 'assets/images/smartphone/youjitu.jpg',
      'description': 'iPhone向けの癒し系壁紙です。',
    },
    {
      'title': 'チ。-地球の運動について-',
      'image': 'assets/images/smartphone/T_ti.jpg',
      'description': 'iPhoneに最適な夜景デザイン。',
    },
    {
      'title': 'ようこそ実力至上主義の教室へ',
      'image': 'assets/images/smartphone/T_youjitu.jpg',
      'description': 'iPhone向けの癒し系壁紙です。',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // タイトルで昇順ソート
    final sortedWallpapers = [...wallpapers];
    sortedWallpapers.sort((a, b) => a['title']!.compareTo(b['title']!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('iPhone 壁紙'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75, // 縦長に調整
          children: sortedWallpapers.map((wallpaper) {
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.black),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          wallpaper['image']!,
                          fit: BoxFit.cover,
                          // スマホ画面向けに高さは自動調整
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          wallpaper['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
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
