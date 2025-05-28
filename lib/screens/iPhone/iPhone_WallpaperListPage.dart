import 'package:flutter/material.dart';
import '/components/common_app_bar.dart';
import '/components/common_drawer.dart';
import 'iPhone_wallpaper_detail_page.dart';

class IPhoneWallpaperListPage extends StatefulWidget {
  @override
  _IPhoneWallpaperListPageState createState() => _IPhoneWallpaperListPageState();
}

class _IPhoneWallpaperListPageState extends State<IPhoneWallpaperListPage> {
  List<Map<String, String>> wallpapers = [
    {
      'title': 'STEINS;GATE',
      'image': 'image/smartphone/STEINS;GATE.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。'
    },
    {
      'title': '<物語シリーズ>',
      'image': 'lib/image/smartphone/monogatari.jpg',
      'description': 'iPhone向けの宇宙デザイン。'
    },

    {
      'title': '薬屋のひとりごと',
      'image': 'lib/image/smartphone/kusuriya[.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。'
    },

    {
      'title': '宝石の国',
      'image': 'lib/image/smartphone/houseki.jpg',
      'description': 'iPhone向けの宇宙デザイン。'
    },

    {
      'title': 'やがて君になる',
      'image': 'lib/image/smartphone/Bloom into you.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。'
    },

    {
      'title': 'ようこそ実力至上主義の教室へ',
      'image': 'lib/image/smartphone/youjitu.jpg',
      'description': 'iPhone向けの宇宙デザイン。'
    },
    // 必要に応じて増やせます
  ];

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredWallpapers = wallpapers.where((wallpaper) {
      return wallpaper['title']!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: CommonAppBar(
        title: 'iPhone 壁紙',
        showSearch: true,
        onSearchChanged: (text) => setState(() => _searchText = text),
      ),
      drawer: CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          shrinkWrap: true,
          children: filteredWallpapers.map((wallpaper) {
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          wallpaper['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        wallpaper['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
