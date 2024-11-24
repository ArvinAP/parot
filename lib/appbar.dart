import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showActions;

  const CustomAppBar({super.key, required this.title, this.showActions = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: showActions
          ? [
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  print("Account sheesh");
                },
              ),
            ]
          : null,
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
