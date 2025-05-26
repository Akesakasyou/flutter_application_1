import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('壁紙ショップ'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'デバイスを選んでください',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.deepPurpleAccent,
              ),
              onPressed: () {
                // iPhone用壁紙ページに遷移（後ほど作成）
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WallpaperListPage(device: 'iPhone'),
                  ),
                );
              },
              icon: const Icon(Icons.phone_iphone),
              label: const Text('iPhone用壁紙', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                // iPad用壁紙ページに遷移（後ほど作成）
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WallpaperListPage(device: 'iPad'),
                  ),
                );
              },
              icon: const Icon(Icons.tablet_mac),
              label: const Text('iPad用壁紙', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// 仮の壁紙リストページ
class WallpaperListPage extends StatelessWidget {
  final String device;

  const WallpaperListPage({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$device 用壁紙一覧'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('$device の壁紙をここに表示します'),
      ),
    );
  }
}
