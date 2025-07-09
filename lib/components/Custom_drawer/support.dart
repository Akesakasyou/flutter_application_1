import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // ここに送信処理を追加（例: APIリクエスト）
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('送信完了'),
          content: const Text('お問い合わせありがとうございました。'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        ),
      );

      // フォームをリセット
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お問い合わせ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // 名前
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'お名前',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? '名前を入力してください' : null,
              ),
              const SizedBox(height: 16),

              // メールアドレス
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$').hasMatch(value)) {
                    return '正しいメールアドレスを入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // お問い合わせ内容
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'お問い合わせ内容',
                  border: OutlineInputBorder(),
                ),
                maxLines: 6,
                validator: (value) =>
                    value == null || value.isEmpty ? '内容を入力してください' : null,
              ),
              const SizedBox(height: 24),

              // 送信ボタン
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('送信'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
