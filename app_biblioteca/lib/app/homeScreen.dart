import 'package:app_biblioteca/appBar.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/funcoes.dart';

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
        drawer: Drawer(
          child: ListView.builder(
            itemCount: colecao.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(colecao[index]),
                ),
              );
            },
          ),
        ),
        body: Column(
          children: [],
        ));
  }
}
