import 'package:flutter/material.dart';
import 'paginas/biblioteca.dart';
import 'paginas/home.dart';
import 'paginas/areausuario.dart';

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
      appBar: AppBar(
        title: Center(child: Text('Livraria')),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.list),
              onSelected: (value) {
                if (value == '/teladelogin') {
                  Navigator.of(context).pushNamed('/teladelogin');
                }
                if (value == '/cadastrolicroegenero') {
                  Navigator.of(context).pushNamed('/cadastrolicroegenero');
                } else if (value == '/cadastroUsuario') {
                  Navigator.of(
                    context,
                  ).pushNamed('/cadastroUsuario');
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Card(
                        child: Text('Cadastrar usuário'),
                      ),
                      value: '/cadastroUsuario',
                    ),
                    PopupMenuItem(
                      child: Card(
                        child: Text('Tela de login'),
                      ),
                      value: '/teladelogin',
                    ),
                    PopupMenuItem(
                      child: Card(
                        child: Text('Tela de cadastro de livro e genero'),
                      ),
                      value: '/cadastrolicroegenero',
                    ),
                  ])
        ],
      ),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          Home(),
          PaginaBiblioteca(),
          AreaUsuario(),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Bibliotéca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Área do usuários',
          ),
        ],
      ),
    );
  }
}
