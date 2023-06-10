import 'package:flutter/material.dart';
import 'package:app_biblioteca/app/addgender.dart';
import 'package:app_biblioteca/app/addbook.dart';
import 'package:app_biblioteca/app/bookUser.dart';
import 'package:app_biblioteca/appBar.dart';
import 'package:app_biblioteca/drawer.dart';

class TelaLogada extends StatefulWidget {
  const TelaLogada({Key? key}) : super(key: key);

  @override
  State<TelaLogada> createState() => _TelaLogadaState();
}

class _TelaLogadaState extends State<TelaLogada> {
  int _paginaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Área do usuário'),
      drawer: CustomDrawer(),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          AreaUserBook(),
          AddGenero(),
          AddLivro(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaSelecionada,
        onTap: (int? novoValor) {
          setState(() {
            _paginaSelecionada = novoValor!;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Cadastro de livro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add),
            label: 'Cadastrar genero',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Cadastrar Livro',
          ),
        ],
      ),
    );
  }
}
