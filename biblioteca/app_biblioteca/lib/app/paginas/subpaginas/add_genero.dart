import 'package:flutter/material.dart';

class AddGenero extends StatefulWidget {
  const AddGenero({super.key});

  @override
  State<AddGenero> createState() => _AddGeneroState();
}

class _AddGeneroState extends State<AddGenero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('Página de adicionar Genero'),
          ),
        ],
      ),
    );
  }
}
