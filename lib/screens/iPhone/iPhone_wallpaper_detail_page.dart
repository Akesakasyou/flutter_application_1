import 'package:flutter/material.dart';
import '/components/purcahse/guest_purchase_page.dart'; // ゲスト購入ページのインポート
import 'iPhone_DescriptionPage.dart' ;
import '/components/Custom_drawer/custom_drawer.dart';


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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                imagePath,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _roundedSmallButton(context, '画像'),
                const SizedBox(width: 20),
                _roundedSmallButton(context, '動画'),
              ],
            ),
            const SizedBox(height: 20),
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
            _roundedFullWidthButton(
              context,
              label: '購入',
              icon: Icons.payment,
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.white, width: 2),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('ログイン機能は未実装です')),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const StadiumBorder(
                                      side: BorderSide(color: Colors.white, width: 2),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                                    child: Text('ログイン', style: TextStyle(fontSize: 18, color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const GuestPurchasePage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const StadiumBorder(
                                      side: BorderSide(color: Colors.white, width: 2),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                    child: Text('ゲスト購入', style: TextStyle(fontSize: 18, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.white),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            _roundedFullWidthButton(
              context,
              label: '解説',
              icon: Icons.info_outline,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GuidePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

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
