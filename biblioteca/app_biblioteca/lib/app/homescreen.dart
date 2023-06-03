import 'package:flutter/material.dart';
import 'paginas/areadousuario.dart';
import 'paginas/home.dart';
import 'paginas/biblioteca.dart';

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
                      child: Text('Add Usuário'),
                      value: '/cadastroUsuario',
                    ),
                    PopupMenuItem(
                      child: Text('Login Usuário'),
                      value: '/teladelogin',
                    ),
                    PopupMenuItem(
                      child: Text('Add Livro/Genero'),
                      value: '/cadastrolicroegenero',
                    ),
                  ])
        ],
      ),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          Home(),
          Biblioteca(),
          AreaDoUsuario(),
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
            label: 'Área do usuário',
          ),
        ],
      ),
    );
  }
}
