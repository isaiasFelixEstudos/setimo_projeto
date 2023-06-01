import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaginaBiblioteca extends StatefulWidget {
  const PaginaBiblioteca({Key? key}) : super(key: key);

  @override
  State<PaginaBiblioteca> createState() => _PaginaBibliotecaState();
}

class _PaginaBibliotecaState extends State<PaginaBiblioteca> {
  final db = FirebaseFirestore.instance;
  final generos = '';
  void getcolecao() {
    final genero = db.collection('generos');
    final generos = genero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('Livros por Gêneros'),
              SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return CarouselSlider(
                  options: CarouselOptions(height: 200),
                  items: [
                    1,
                    2,
                    3,
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          color: Colors.red,
                          child: ListTile(
                            title: Text('Nome Livro $i'),
                            subtitle: Text('Páginas'),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: getcolecao, child: Text('Clique aqui'))
        ],
      ),
    );
  }
}
