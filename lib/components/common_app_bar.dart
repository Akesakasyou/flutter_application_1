import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearch;
  final Function(String)? onSearchChanged;

  const CommonAppBar({
    super.key,
    required this.title,
    this.showSearch = false,
    this.onSearchChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            // カート画面へ遷移
          },
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            // 会員情報画面へ遷移
          },
        ),
      ],
      bottom: showSearch
          ? PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '検索',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: onSearchChanged,
                ),
              ),
            )
          : null,
    );
  }
}
