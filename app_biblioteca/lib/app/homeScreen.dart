import 'package:app_biblioteca/appBar.dart';
import 'package:flutter/material.dart';
import 'package:app_biblioteca/funcoes.dart';

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
      drawer: Drawer(
        child: Expanded(
          child: ListView.builder(
            itemCount: icone.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(texto[index]),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('${rota[index].toString()}');
                  },
                ),
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
