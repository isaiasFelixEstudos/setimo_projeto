import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://viverdeblog.com/wp-content/uploads/2017/04/como-escrever-um-livro-topo.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
