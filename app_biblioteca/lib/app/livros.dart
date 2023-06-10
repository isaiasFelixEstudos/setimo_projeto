import 'package:flutter/material.dart';
import 'package:app_biblioteca/appBar.dart';
import 'package:app_biblioteca/drawer.dart';

class PgLivros extends StatefulWidget {
  const PgLivros({super.key});

  @override
  State<PgLivros> createState() => _PgLivrosState();
}

class _PgLivrosState extends State<PgLivros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Livros'),
      drawer: CustomDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}
