import 'package:flutter/material.dart';
import 'subpaginas/add_genero.dart';
import 'subpaginas/add_livro.dart';

class CadastrarGeneroLivro extends StatefulWidget {
  const CadastrarGeneroLivro({super.key});

  @override
  State<CadastrarGeneroLivro> createState() => _CadastrarGeneroLivroState();
}

class _CadastrarGeneroLivroState extends State<CadastrarGeneroLivro> {
  int _paginaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Livros e Genero')),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
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
            icon: Icon(Icons.book),
            label: 'Cadastrar Genero',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Cadastrar Livro',
          ),
        ],
      ),
    );
  }
}
