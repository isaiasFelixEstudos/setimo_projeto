import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_biblioteca/controleUsuario.dart';

class AreaUserBook extends StatefulWidget {
  const AreaUserBook({super.key});

  @override
  State<AreaUserBook> createState() => _AreaUserBookState();
}

class _AreaUserBookState extends State<AreaUserBook> {
  @override
  Widget build(BuildContext context) {
    final controllUser = Get.find<UserController>();
    return Scaffold(
      body: Column(
        children: [Text('Ola, ${controllUser.user?.email}')],
      ),
    );
  }
}
