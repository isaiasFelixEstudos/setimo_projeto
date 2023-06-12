import 'package:flutter/material.dart';
import 'package:app_biblioteca/app/paginas/addgender.dart';
import 'package:app_biblioteca/app/paginas/addbook.dart';
import 'package:app_biblioteca/app/paginas/bookUser.dart';
import 'package:app_biblioteca/ferramentas/appBar.dart';
import 'package:app_biblioteca/ferramentas/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Livraria'),
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
            label: 'Livros do usuário',
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
