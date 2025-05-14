import 'package:flutter/material.dart';

import 'WallpaperListPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('壁紙をお探しですか？'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'あなたはどのデバイスで壁紙をお探しですか？',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WallpaperListPage()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    side: BorderSide(color: Colors.black, width: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
  ),
  child: Text(
    'iPhone',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
  ),
),
              SizedBox(width: 40),
              ElevatedButton(
  onPressed: () {
    // iPadが選択されたときの処理
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // 背景色を白に
    side: BorderSide(color: Colors.black, width: 3), // 枠線を追加
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // 角丸
    ),
    padding: EdgeInsets.symmetric(vertical: 80, horizontal: 100), // 横長に調整
  ),
  child: Text(
    'iPad',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
  ),
),
            ],
          ),
        ],
      ),
    );
  }
}