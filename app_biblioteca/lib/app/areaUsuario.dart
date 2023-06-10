import 'package:flutter/material.dart';
import 'package:app_biblioteca/appBar.dart';
import 'package:app_biblioteca/drawer.dart';
import 'package:app_biblioteca/controleUsuario.dart';

class TelaLogada extends StatefulWidget {
  const TelaLogada({Key? key}) : super(key: key);

  @override
  State<TelaLogada> createState() => _TelaLogadaState();
}

class _TelaLogadaState extends State<TelaLogada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cadastro de usuário'),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Center(
            child: Text('Olá. Bem-Vindo a tela logada'),
          )
        ],
      ),
    );
  }
}
