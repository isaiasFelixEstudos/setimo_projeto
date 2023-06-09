import 'package:flutter/material.dart';

class TelaLogada extends StatefulWidget {
  const TelaLogada({Key? key}) : super(key: key);

  @override
  State<TelaLogada> createState() => _TelaLogadaState();
}

class _TelaLogadaState extends State<TelaLogada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela logada'),
      ),
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
