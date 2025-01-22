import 'package:flutter/material.dart';
import 'package:flutter_application_1/FirstPage.dart';


class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
      ),
      body: Center(
        child: TextButton(
          child: const Text("1ページ目に遷移する"),
          onPressed: (){
            // （1） 指定した画面に遷移する
            Navigator.push(context, MaterialPageRoute(
              // （2） 実際に表示するページ(ウィジェット)を指定する
              builder: (context) => FirstPage()
            ));
          },
        ),
      ),
    );
  }
}