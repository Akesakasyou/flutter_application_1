import 'package:flutter/material.dart';

class PurchasePage extends StatelessWidget {
  final int totalPrice;

  const PurchasePage({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('購入確認'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('合計金額: $totalPrice 円',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            const Text('購入を確定しますか？',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // ここで購入処理（未実装）
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('購入完了'),
                    content: const Text('ご購入ありがとうございました。'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: const Text('閉じる'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('購入確定', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('戻る', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
