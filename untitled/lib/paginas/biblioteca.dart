import 'package:flutter/material.dart';

class PaginaBiblioteca extends StatefulWidget {
  const PaginaBiblioteca({super.key});

  @override
  State<PaginaBiblioteca> createState() => _PaginaBibliotecaState();
}

class _PaginaBibliotecaState extends State<PaginaBiblioteca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('Livros por Generos'),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text("Cliente: "),
                      subtitle: Text("Idade: "),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
