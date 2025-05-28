import 'package:flutter/material.dart';

class GenrePage extends StatelessWidget {
  final String genre;

  const GenrePage({required this.genre, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$genre 壁紙一覧'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          '$genre ページ（ここに壁紙一覧などを表示）',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
