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
      backgroundColor: const Color(0xFFFFFDE7), // メモ帳のような背景色
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 画像
            Center(
              child: Image.asset(
                imagePath,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // タイトル
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // 画像・動画ボタン（横並び）
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _roundedSmallButton(context, '画像'),
                const SizedBox(width: 20),
                _roundedSmallButton(context, '動画'),
              ],
            ),
            const SizedBox(height: 20),

            // カート追加ボタン
            _roundedFullWidthButton(
              context,
              label: 'カート追加',
              icon: Icons.add_shopping_cart,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('カートに追加しました（仮）')),
                );
              },
            ),
            const SizedBox(height: 16),

            // 購入ボタン
            _roundedFullWidthButton(
              context,
              label: '購入',
              icon: Icons.payment,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('購入機能は未実装です')),
                );
              },
            ),
            const SizedBox(height: 16),

            // かいせつボタン
            _roundedFullWidthButton(
              context,
              label: 'かいせつ',
              icon: Icons.info_outline,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('かいせつ'),
                    content: Text(description),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('閉じる'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // 小さい丸ボタン（画像・動画用）
  Widget _roundedSmallButton(BuildContext context, String label) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$labelを表示中（仮）')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  // 横長の丸ボタン（カート・購入・かいせつ）
  Widget _roundedFullWidthButton(BuildContext context,
      {required String label, required IconData icon, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
