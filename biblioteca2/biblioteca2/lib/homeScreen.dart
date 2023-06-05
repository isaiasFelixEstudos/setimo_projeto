import 'package:flutter/material.dart';
import 'paginas/pg_login.dart';
import 'paginas/pg_caduser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _paginaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('App Bibliotéca'),
        ),
      ),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          Login(),
          CadastrarUsuario(),
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
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration_rounded),
            label: 'Cadastrar Usuário',
          ),
        ],
      ),
    );
  }
}
