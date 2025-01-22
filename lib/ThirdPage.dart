import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget{
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text("ページ(3)")
      ),
      body : Center(
        child: TextButton(
          child: const Text("最初のページに戻る"),
          // （1） 前の画面に戻る
          onPressed: (){
            // 1ページ前に戻す場合
            // Navigator.pop(context);
            
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      )
    );
  }
}