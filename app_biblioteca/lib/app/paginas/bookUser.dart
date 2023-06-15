import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_biblioteca/funcoes/controleUsuario.dart';

class AreaUserBook extends StatefulWidget {
  const AreaUserBook({super.key});

  @override
  State<AreaUserBook> createState() => _AreaUserBookState();
}

class _AreaUserBookState extends State<AreaUserBook> {
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Text('${_userController.user?.email ?? "Usuário não logado"}')
        ],
      ),
    );
  }
}
