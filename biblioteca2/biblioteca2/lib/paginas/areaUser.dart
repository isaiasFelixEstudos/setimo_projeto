import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AreaUser extends StatefulWidget {
  const AreaUser({super.key});

  @override
  State<AreaUser> createState() => _AreaUserState();
}

class _AreaUserState extends State<AreaUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área do Usuário'),
      ),
      body: Column(
        children: [Text('Área do Usuário')],
      ),
    );
  }
}
