import 'package:flutter/material.dart';

class WallpaperDescriptionPage extends StatelessWidget {
  final String title;
  final String description;

  const WallpaperDescriptionPage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ← 背景を白に変更
      appBar: AppBar(
        title: Text('$title の解説'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 左側：動画風サムネイル
            Container(
              width: 150,
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: const Center(
                child: Icon(Icons.play_circle_outline,
                    color: Colors.black, size: 50), // 黒に変更
              ),
            ),
            const SizedBox(width: 16),
            // 右側：説明テキスト
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '説明文',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black, // 黒文字
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black, // 黒文字
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
