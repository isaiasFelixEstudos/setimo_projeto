import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Home'),
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.list),
              onSelected: (value) {
                if (value == '/cadastroUsuario') {
                  Navigator.of(context).pushNamed('/cadastroUsuario');
                }
                if (value == '/teladelogin') {
                  Navigator.of(context).pushNamed('/teladelogin');
                } else if (value == '/home') {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Home'),
                      value: '/home',
                    ),
                    PopupMenuItem(
                      child: Text('Cadastrar usuário'),
                      value: '/cadastroUsuario',
                    ),
                    PopupMenuItem(
                      child: Text('Tela de login'),
                      value: '/teladelogin',
                    ),
                  ])
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    'https://viverdeblog.com/wp-content/uploads/2017/04/como-escrever-um-livro-topo.png',
                    width: 300,
                    height: 300,
                  ),
                ),
                Divider(height: 20,)

              ],
            ),
          )
        ],
      ),
    );
  }
}
