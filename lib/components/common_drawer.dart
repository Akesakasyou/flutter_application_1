import 'package:flutter/material.dart';
import 'genre_page.dart';  // 実際のパスに合わせてください
import 'common_drawer.dart'; // CommonDrawerを別ファイルにした場合

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '壁紙アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iPhone 壁紙（全ジャンル）'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white), // ハンバーガーメニューを白に
      ),
      drawer: CommonDrawer(),
      body: const Center(
        child: Text('ここに壁紙一覧表示などを実装'),
      ),
    );
  }
}


// common_drawer.dart の例
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
        Navigator.pop(context); // ドロワー閉じる
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GenrePage(genre: genre),
          ),
        );
      },
    );
  }
}

// genre_page.dart の例
class GenrePage extends StatelessWidget {
  final String genre;

  const GenrePage({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iPhone 壁紙（$genre）'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white), // ハンバーガーメニュー白
      ),
      body: Center(
        child: Text('$genre ジャンルの壁紙一覧をここに表示'),
      ),
    );
  }
}
