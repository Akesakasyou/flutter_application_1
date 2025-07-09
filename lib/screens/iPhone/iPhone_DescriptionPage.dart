import 'package:flutter/material.dart';
import '/components/Custom_drawer/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  // 外部リンクを開く関数
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ご利用ガイド'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 254), // メモ帳風背景
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ご購入ありがとうございました。\nこちらは解説ページになります。',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              const Text(
                '購入していただいたアイコンの写真、ホーム画面の壁紙とショートカットを使ってサンプルの画像のようにしてもらいます。',
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              const Text(
                'ウィジェットについて',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              const Text(
                '画像にあるウィジェットをお使いになりたい方は「Mico Widget」アプリをダウンロードしてください。有料なのでご了承ください。',
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _launchURL('https://play.google.com/store/apps/details?id=com.sm.mico&hl=en-US');
                },
                child: const Text('Android版を開く'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchURL('https://apps.apple.com/jp/app/mico-%E3%82%A6%E3%82%A3%E3%82%B8%E3%82%A7%E3%83%83%E3%83%88-%E5%A3%81%E7%B4%99/id1640653011');
                },
                child: const Text('iOS版を開く'),
              ),
              const SizedBox(height: 24),
              const Text(
                'ショートカットアイコンの作り方',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              _buildStep('①', '「ショートカット」アプリを開きます。'),
              _buildStep('②', '「＋」ボタンをタップして、新しいショートカットを作成します。'),
              _buildStep('③', '「アクションを追加」をタップします。'),
              _buildStep('④', '「Appを開く」を選択します。'),
              _buildStep('⑤', '「App」をタップし、アプリを選びます。'),
              _buildStep('⑥', '共有アイコンから「ホーム画面に追加」を選びます。'),
              _buildStep('⑦', '「写真を選択」でアイコン画像を選びます。'),
              _buildStep('⑧', 'アイコンの名前を入力します。'),
              _buildStep('⑨', '右上の「追加」をタップします。'),
              const SizedBox(height: 24),
              const Text(
                '壁紙の設定方法',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              _buildStep('①', '「設定」アプリを開き、「壁紙」を選択します。'),
              _buildStep('②', '「壁紙を選択」で写真やカテゴリから画像を選びます。'),
              _buildStep('③', '必要に応じてカスタマイズし、「追加」をタップします。'),
              _buildStep('④', '「壁紙を両方に設定」で完了です。'),
              const SizedBox(height: 24),
              const Text(
                'これで壁紙の設定が完了します。\nご不明な点があればお気軽にご連絡ください。',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
