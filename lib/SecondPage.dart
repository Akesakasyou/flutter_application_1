import 'package:flutter/material.dart';
import 'package:flutter_application_1/ThirdPage.dart';

class SecondPage extends StatelessWidget{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text("ページ(2)")
      ),
      body : Center(
        child: TextButton(
          child: const Text("3ページに遷移"),
          // （1） 前の画面に戻る
          onPressed: (){
             // （1） 指定した画面に遷移する
            Navigator.push(context, MaterialPageRoute(
              // （2） 実際に表示するページ(ウィジェット)を指定する
              builder: (context) => ThirdPage()
            ));
          },
        ),
      )
    );
  }
}