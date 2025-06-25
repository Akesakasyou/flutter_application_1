import 'package:flutter/material.dart';
import 'CompletionPage.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('ご確認'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StepLabel(label: 'ご入力'),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '支払い'),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '確認', isActive: true),
                Icon(Icons.arrow_forward, color: Colors.white),
                StepLabel(label: '完了'),
              ],
            ),

            const SizedBox(height: 32),
            const Text('以下の情報でよろしいですか？', style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 24),

            const Text('お名前: 山田 太郎', style: TextStyle(color: Colors.white)),
            const Text('電話番号: 090-1234-5678', style: TextStyle(color: Colors.white)),
            const Text('メール: taro@example.com', style: TextStyle(color: Colors.white)),
            const Text('カード番号: **** **** **** 1234', style: TextStyle(color: Colors.white)),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const CompletionPage()),
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
                child: const Text('購入を確定', style: TextStyle(fontSize: 18)),
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
