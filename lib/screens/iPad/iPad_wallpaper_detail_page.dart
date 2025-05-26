import 'package:flutter/material.dart';

class WallpaperDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const WallpaperDetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(imagePath, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(description, style: TextStyle(fontSize: 16)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('購入機能は未実装です')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('購入・ダウンロード', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
