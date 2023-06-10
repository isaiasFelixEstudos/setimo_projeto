import 'package:flutter/material.dart';
import 'deslogarusuario.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.book),
            SizedBox(width: 8),
            Text(title),
            SizedBox(width: 8),
            Icon(Icons.book),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            deslogarFirebase();
            Navigator.of(context).pushNamed('/login');
          },
          child: Icon(Icons.logout),
        )
      ],
    );
  }
}
