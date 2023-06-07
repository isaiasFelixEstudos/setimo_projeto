import 'package:app_biblioteca/appBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Livraria'),
      body: Column(
        children: [
          Image.network(
            'https://viverdeblog.com/wp-content/uploads/2017/04/como-escrever-um-livro-topo.png',
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}
