import 'package:flutter/material.dart';
import '/components/Custom_drawer/custom_drawer.dart';
import 'iPhone_wallpaper_detail_page.dart'; // スマホ用の詳細ページを想定

class IPhoneWallpaperListPage extends StatefulWidget {
  const IPhoneWallpaperListPage({super.key});

  @override
  State<IPhoneWallpaperListPage> createState() => _IPhoneWallpaperListPageState();
}

class _IPhoneWallpaperListPageState extends State<IPhoneWallpaperListPage> {
  final List<Map<String, String>> wallpapers = [
    {
      'title': '<物語シリーズ>',
      'image': 'assets/images/smartphone/monogatari.jpg',
      'description': 'iPhone向けの宇宙デザイン。',
      'genre': 'アニメ',
    },
    {
      'title': '薬屋のひとりごと',
      'image': 'assets/images/smartphone/kusuriya[.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。',
      'genre': 'シンプル',
    },
    {
      'title': '宝石の国',
      'image': 'assets/images/smartphone/houseki.jpg',
      'description': 'iPhone向けの宇宙デザイン。',
      'genre': '未来系',
    },
    {
      'title': 'やがて君になる',
      'image': 'assets/images/smartphone/Bloom into you.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。',
      'genre': 'アーティスト',
    },
    {
      'title': 'ようこそ実力至上主義の教室へ',
      'image': 'assets/images/smartphone/youjitu.jpg',
      'description': 'iPhone向けの宇宙デザイン。',
      'genre': 'アニメ',
    },
    {
      'title': 'ゾンビランドサガ',
      'image': 'assets/images/smartphone/zonbirandosaga.jpg',
      'description': 'iPhone向けの宇宙デザイン。',
      'genre': 'アニメ',
    },
  ];

  bool _isSearching = false;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get filteredWallpapers {
    if (_searchQuery.isEmpty) {
      return wallpapers;
    } else {
      return wallpapers
          .where((wallpaper) =>
              wallpaper['title']!.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final sortedWallpapers = [...filteredWallpapers];
    sortedWallpapers.sort((a, b) => a['title']!.compareTo(b['title']!));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: '検索...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              )
            : Row(
                children: [
                  const Expanded(
                    child: Text('iPhone 壁紙'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
        actions: _isSearching
            ? [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      _searchQuery = '';
                      _searchController.clear();
                    });
                  },
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
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
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.asset(
                          wallpaper['image']!,
                          fit: BoxFit.contain, // ← ここを変更
                          height: 1000,
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
