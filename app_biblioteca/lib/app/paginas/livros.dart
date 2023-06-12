import 'package:app_biblioteca/app/paginas/arealivros.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/ferramentas/appBar.dart';
import 'package:app_biblioteca/ferramentas/drawer.dart';

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
      body: AreaLivros(),
    );
  }
}
