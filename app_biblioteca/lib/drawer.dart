import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_biblioteca/controleUsuario.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final controllUser = Get.put(UserController());
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(controllUser.user?.displayName ?? ''),
            accountEmail: Text(controllUser.user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                  controllUser.user?.email?.isNotEmpty == true
                      ? controllUser.user!.email![0]
                      : 'C',
                  style: TextStyle(fontSize: 40.0)),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Cadastro de Usuario'),
              onTap: () {
                Navigator.of(context).pushNamed('/CadUser');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Livros'),
              onTap: () {
                Navigator.of(context).pushNamed('/livros');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_2),
              title: Text('Atualizar cadastro de usuário'),
              onTap: () {
                Navigator.of(context).pushNamed('/updateuser');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_2_sharp),
              title: Text('Área do Usuários'),
              onTap: () {
                Navigator.of(context).pushNamed('/areusuario');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_2_sharp),
              title: Text('Cadastrar Livros'),
              onTap: () {
                Navigator.of(context).pushNamed('');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_2_sharp),
              title: Text('Livros que li'),
              onTap: () {
                Navigator.of(context).pushNamed('');
              },
            ),
          ),
        ],
      ),
    );
  }
}
