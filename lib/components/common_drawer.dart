import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text('ジャンル別', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          _buildGenreItem(context, 'アニメ'),
          _buildGenreItem(context, 'アーティスト'),
          _buildGenreItem(context, 'シンプル'),
          _buildGenreItem(context, '未来系'),
        ],
      ),
    );
  }

  Widget _buildGenreItem(BuildContext context, String genre) {
    return ListTile(
      title: Text(genre),
      onTap: () {
        // ジャンル別ページへ遷移処理
        Navigator.pop(context);
      },
    );
  }
}
