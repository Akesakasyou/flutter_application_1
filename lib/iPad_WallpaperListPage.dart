import 'package:flutter/material.dart';

class WallpaperListPage extends StatefulWidget {
  @override
  _WallpaperListPageState createState() => _WallpaperListPageState();
}

class _WallpaperListPageState extends State<WallpaperListPage> {
  final List<Map<String, String>> _allWallpapers = [
    {
      "image": "lib/image/Bloom into you.jpg",
      "name": "やがて君になる",
      "genre": "アニメ"
    },
    {
      "image": "lib/image/houseki.jpg",
      "name": "宝石の国",
      "genre": "アニメ"
    },
    {
      "image": "lib/image/kusuriya[.jpg",
      "name": "薬屋のひとりごと",
      "genre": "アニメ"
    },
    {
      "image": "lib/image/monogatari.jpg",
      "name": "<物語シリーズ>",
      "genre": "アニメ"
    },
    {
      "image": "lib/image/STEINS;GATE.jpg",
      "name": "STEINS;GATE",
      "genre": "アニメ"
    },
    {
      "image": "lib/image/youjitu.jpg",
      "name": "ようこそ実力至上主義の教室へ",
      "genre": "アニメ"
    },
  ];

  List<Map<String, String>> _filteredWallpapers = [];
  Set<String> _favoriteNames = {};
  String _searchText = "";
  String _selectedGenre = "すべて";
  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    _applyFilter();
  }

  void _applyFilter() {
    setState(() {
      _filteredWallpapers = _allWallpapers.where((item) {
        final matchesSearch = item["name"]!.contains(_searchText);
        final matchesGenre = _selectedGenre == "すべて" || item["genre"] == _selectedGenre;
        return matchesSearch && matchesGenre;
      }).toList();

      _filteredWallpapers.sort((a, b) {
        return _isAscending
            ? a["name"]!.compareTo(b["name"]!)
            : b["name"]!.compareTo(a["name"]!);
      });
    });
  }

  void _toggleFavorite(String name) {
    setState(() {
      if (_favoriteNames.contains(name)) {
        _favoriteNames.remove(name);
      } else {
        _favoriteNames.add(name);
      }
    });
  }

  void _selectGenre(String genre) {
    Navigator.pop(context); // Drawer を閉じる
    _selectedGenre = genre;
    _applyFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("壁紙一覧"),
        actions: [
          IconButton(
            icon: Icon(_isAscending ? Icons.arrow_downward : Icons.arrow_upward),
            tooltip: "昇順/降順切り替え",
            onPressed: () {
              _isAscending = !_isAscending;
              _applyFilter();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "ジャンル選択",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text("すべて"),
              onTap: () => _selectGenre("すべて"),
            ),
            ListTile(
              title: Text("アニメ"),
              onTap: () => _selectGenre("アニメ"),
            ),
            ListTile(
              title: Text("アーティスト"),
              onTap: () => _selectGenre("アーティスト"),
            ),
            ListTile(
              title: Text("シンプル"),
              onTap: () => _selectGenre("シンプル"),
            ),
            ListTile(
              title: Text("ジブリ"),
              onTap: () => _selectGenre("ジブリ"),
            ),
            ListTile(
              title: Text("未来系"),
              onTap: () => _selectGenre("未来系"),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "検索",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _searchText = value;
                _applyFilter();
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: _filteredWallpapers.length,
                itemBuilder: (context, index) {
                  final wallpaper = _filteredWallpapers[index];
                  final isFavorite = _favoriteNames.contains(wallpaper["name"]);

                  return Stack(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${wallpaper["name"]} を選択しました")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.asset(
                                  wallpaper["image"]!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                wallpaper["name"]!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () => _toggleFavorite(wallpaper["name"]!),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
