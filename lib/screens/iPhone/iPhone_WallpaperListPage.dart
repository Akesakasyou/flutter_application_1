import 'package:flutter/material.dart';

// CommonDrawerをここに含めています（別ファイルならimportしてください）
class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text('ジャンル別', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: Text('全ジャンル'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => IPhoneWallpaperListPage(genre: null)),
              );
            },
          ),
          _buildGenreItem(context, 'アニメ'),
          _buildGenreItem(context, 'アーティスト'),
          _buildGenreItem(context, 'シンプル'),
          _buildGenreItem(context, '未来系'),
        ],
      ),
    );
  }

  Widget _buildGenreItem(BuildContext context, String genre) {
    return ListTile(
      title: Text(genre),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => IPhoneWallpaperListPage(genre: genre)),
        );
      },
    );
  }
}

// メインページ
class IPhoneWallpaperListPage extends StatefulWidget {
  final String? genre; // nullなら全ジャンル表示

  IPhoneWallpaperListPage({this.genre});

  @override
  _IPhoneWallpaperListPageState createState() => _IPhoneWallpaperListPageState();
}

class _IPhoneWallpaperListPageState extends State<IPhoneWallpaperListPage> {
  List<Map<String, String>> wallpapers = [
    {
      'title': 'STEINS;GATE',
      'image': 'image/smartphone/STEINS;GATE.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。',
      'genre': 'アニメ',
    },
    {
      'title': '<物語シリーズ>',
      'image': 'lib/image/smartphone/monogatari.jpg',
      'description': 'iPhone向けの宇宙デザイン。',
      'genre': 'アニメ',
    },
    {
      'title': '薬屋のひとりごと',
      'image': 'lib/image/smartphone/kusuriya[.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。',
      'genre': 'シンプル',
    },
    {
      'title': '宝石の国',
      'image': 'lib/image/smartphone/houseki.jpg',
      'description': 'iPhone向けの宇宙デザイン。',
      'genre': '未来系',
    },
    {
      'title': 'やがて君になる',
      'image': 'lib/image/smartphone/Bloom into you.jpg',
      'description': 'iPhone向けの夕焼け壁紙です。',
      'genre': 'アーティスト',
    },
    {
      'title': 'ようこそ実力至上主義の教室へ',
      'image': 'lib/image/smartphone/youjitu.jpg',
      'description': 'iPhone向けの宇宙デザイン。',
      'genre': 'アニメ',
    },
  ];

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredWallpapers = wallpapers.where((wallpaper) {
      final matchesGenre = widget.genre == null || wallpaper['genre'] == widget.genre;
      final matchesSearch = wallpaper['title']!.toLowerCase().contains(_searchText.toLowerCase());
      return matchesGenre && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.genre == null ? 'iPhone 壁紙（全ジャンル）' : 'iPhone 壁紙（${widget.genre}）',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: WallpaperSearchDelegate(wallpapers, widget.genre));
            },
          )
        ],
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

// 簡単な検索用のDelegate (お好みでカスタマイズ可)
class WallpaperSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> wallpapers;
  final String? genre;

  WallpaperSearchDelegate(this.wallpapers, this.genre);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = wallpapers.where((wallpaper) {
      final matchesGenre = genre == null || wallpaper['genre'] == genre;
      return wallpaper['title']!.toLowerCase().contains(query.toLowerCase()) && matchesGenre;
    }).toList();

    return ListView(
      children: results.map((wallpaper) {
        return ListTile(
          title: Text(wallpaper['title']!),
          onTap: () {
            close(context, null);
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
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = wallpapers.where((wallpaper) {
      final matchesGenre = genre == null || wallpaper['genre'] == genre;
      return wallpaper['title']!.toLowerCase().contains(query.toLowerCase()) && matchesGenre;
    }).toList();

    return ListView(
      children: suggestions.map((wallpaper) {
        return ListTile(
          title: Text(wallpaper['title']!),
          onTap: () {
            query = wallpaper['title']!;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
}

// WallpaperDetailPageの簡単な例（本来は別ファイルで実装）
class WallpaperDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const WallpaperDetailPage({
    required this.title,
    required this.imagePath,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(description, style: const TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
