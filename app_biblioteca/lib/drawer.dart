import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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
              leading: Icon(Icons.account_circle),
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).pushNamed('/login');
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
              leading: Icon(Icons.person_2_sharp),
              title: Text('Área do Usuários'),
              onTap: () {
                Navigator.of(context).pushNamed('/areusuario');
              },
            ),
          ),
        ],
      ),
    );
  }
}
