import 'package:flutter/material.dart';

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
        children: [],
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
            label: 'Cadastrar Livro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Cadastrar Genero',
          ),
        ],
      ),
    );
  }
}