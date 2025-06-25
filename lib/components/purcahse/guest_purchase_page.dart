import 'package:flutter/material.dart';

class GuestPurchasePage extends StatelessWidget {
  const GuestPurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    // テキストフィールドの共通装飾
    final textFieldDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('ゲスト購入'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ステップバー
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StepLabel(label: 'ご入力', isActive: true),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '支払い'),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '確認'),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '完了'),
              ],
            ),

            const SizedBox(height: 32),
            const Text(
              '購入者さま',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),

            const SizedBox(height: 24),
            const Text('お名前', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(decoration: textFieldDecoration),

            const SizedBox(height: 16),
            const Text('電話番号', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: textFieldDecoration,
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 16),
            const Text('メール', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: textFieldDecoration,
              keyboardType: TextInputType.emailAddress,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 次のステップへ（仮）
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('次へ（仮動作）')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('次へ', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ステップバーの文字ラベル用ウィジェット
class StepLabel extends StatelessWidget {
  final String label;
  final bool isActive;

  const StepLabel({super.key, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: isActive ? Colors.white : Colors.grey,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        fontSize: 16,
      ),
    );
  }
}
