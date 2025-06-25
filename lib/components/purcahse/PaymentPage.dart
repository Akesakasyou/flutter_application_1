import 'package:flutter/material.dart';
import 'ConfirmationPage.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('お支払い'),
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
                StepLabel(label: 'ご入力'),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '支払い', isActive: true),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '確認'),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '完了'),
              ],
            ),

            const SizedBox(height: 32),
            const Text('クレジットカード番号', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(decoration: textFieldDecoration),

            const SizedBox(height: 16),
            const Text('有効期限（月/年）', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(decoration: textFieldDecoration),

            const SizedBox(height: 16),
            const Text('セキュリティコード', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(decoration: textFieldDecoration),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConfirmationPage()),
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
                child: const Text('確認へ進む', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
