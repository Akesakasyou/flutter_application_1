import 'package:flutter/material.dart';
import '/components/Custom_drawer/custom_drawer.dart';
import 'iPad_wallpaper_detail_page.dart';

class IPadWallpaperListPage extends StatefulWidget {
  const IPadWallpaperListPage({super.key});

  @override
  State<IPadWallpaperListPage> createState() => _IPadWallpaperListPageState();
}

class _IPadWallpaperListPageState extends State<IPadWallpaperListPage> {
  final List<Map<String, String>> wallpapers = [
    {
      'title': 'コードギアス',
      'image': 'assets/images/tablet/T_codegiasu.jpg',
      'description': 'iPad向けの癒し系壁紙です。',
    },
    {
      'title': 'ゴールデンタイム',
      'image': 'assets/images/tablet/T_GoldenTime.jpg',
      'description': 'iPad向けの癒し系壁紙です。',
    },
    {
      'title': 'ひぐらしのなく頃に',
      'image': 'assets/images/tablet/T_higurasi.jpg',
      'description': 'iPadに最適な夜景デザイン。',
    },
    {
      'title': '薬屋のひとりごと',
      'image': 'assets/images/tablet/T_kusuriya.jpg',
      'description': 'iPad向けの癒し系壁紙です。',
    },
    {
      'title': '<物語シリーズ>',
      'image': 'assets/images/tablet/T_monogatari.jpg',
      'description': 'iPadに最適な夜景デザイン。',
    },
    {
      'title': 'STEINS;GATE',
      'image': 'assets/images/tablet/T_STEINS;GATE.jpg',
      'description': 'iPad向けの癒し系壁紙です。',
    },
    {
      'title': 'チ。-地球の運動について-',
      'image': 'assets/images/tablet/T_ti.jpg',
      'description': 'iPadに最適な夜景デザイン。',
    },
    {
      'title': 'ようこそ実力至上主義の教室へ',
      'image': 'assets/images/tablet/T_youjitu.jpg',
      'description': 'iPad向けの癒し系壁紙です。',
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
          .where((wallpaper) => wallpaper['title']!
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
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
            : const Text('iPad 壁紙'),
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
            : [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
              ],
      ),
      drawer: const CustomDrawer(),
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
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.black),
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      wallpaper['image']!,
                      fit: BoxFit.cover,
                      height: 850,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
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
