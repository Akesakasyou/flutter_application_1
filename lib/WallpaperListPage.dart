import 'package:flutter/material.dart';

class WallpaperListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 壁紙のデータ（仮のリスト）
    final List<Map<String, String>> wallpapers = [
      {"image": "https://via.placeholder.com/150", "name": "シンプルデザイン"},
      {"image": "https://via.placeholder.com/150", "name": "ナチュラルスタイル"},
      {"image": "https://via.placeholder.com/150", "name": "モダンアート"},
      {"image": "https://via.placeholder.com/150", "name": "クラシックパターン"},
      {"image": "https://via.placeholder.com/150", "name": "フューチャーデザイン"},
      {"image": "https://via.placeholder.com/150", "name": "ミニマルスタイル"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("壁紙一覧"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2列のグリッド
            crossAxisSpacing: 8.0, // 横の間隔
            mainAxisSpacing: 8.0, // 縦の間隔
            childAspectRatio: 0.8, // アイテムの縦横比
          ),
          itemCount: wallpapers.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // ボタンを押したときの処理（仮）
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${wallpapers[index]["name"]} を選択しました")),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // 画像をボタン全体に広げる
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        wallpapers[index]["image"]!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      wallpapers[index]["name"]!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}