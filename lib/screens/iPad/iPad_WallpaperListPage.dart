import 'package:flutter/material.dart';
import '/components/common_app_bar.dart';
import '/components/common_drawer.dart';
import 'iPad_wallpaper_detail_page.dart';

class IPadWallpaperListPage extends StatelessWidget {
  final List<Map<String, String>> wallpapers = [
    {
      'title': 'コードギアス',
      'image': 'assets/images/tablet/T_codegiasu.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': 'ゴールデンタイム',
      'image': 'assets/images/tablet/T_GoldenTime.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': 'ひぐらしのなく頃に',
      'image': 'assets/images/tablet/T_higurasi.jpg',
      'description': 'iPadに最適な夜景デザイン。'
    },
    {
      'title': '薬屋のひとりごと',
      'image': 'assets/images/tablet/T_kusuriya.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': '<物語シリーズ>',
      'image': 'assets/images/tablet/T_monogatari.jpg',
      'description': 'iPadに最適な夜景デザイン。'
    },
    {
      'title': 'STEINS;GATE',
      'image': 'assets/images/tablet/T_STEINS;GATE.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
    {
      'title': 'チ。-地球の運動について-',
      'image': 'assets/images/tablet/T_ti.jpg',
      'description': 'iPadに最適な夜景デザイン。'
    },
    {
      'title': 'ようこそ実力至上主義の教室へ',
      'image': 'assets/images/tablet/T_youjitu.jpg',
      'description': 'iPad向けの癒し系壁紙です。'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // タイトルで昇順ソート
    final sortedWallpapers = [...wallpapers];
    sortedWallpapers.sort((a, b) => a['title']!.compareTo(b['title']!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('iPad 壁紙'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sortedWallpapers.length,
        itemBuilder: (context, index) {
          final wallpaper = sortedWallpapers[index];
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
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.black),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      wallpaper['image']!,
                      fit: BoxFit.cover,
                      width: 900,
                      height: 900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        wallpaper['title']!,
                        style: const TextStyle(
                          fontSize: 18,
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
        },
      ),
    );
  }
}
