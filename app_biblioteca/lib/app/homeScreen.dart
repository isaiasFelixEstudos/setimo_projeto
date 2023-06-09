import 'package:app_biblioteca/appBar.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Livraria'),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Center(
            child: Icon(
              Icons.local_library,
              size: 100,
            ),
          ),
          Center(
            child: Text('Bibliotéca'),
          )
        ],
      ),
    );
  }
}
