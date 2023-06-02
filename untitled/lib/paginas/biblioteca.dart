import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaginaBiblioteca extends StatefulWidget {
  const PaginaBiblioteca({Key? key}) : super(key: key);

  @override
  State<PaginaBiblioteca> createState() => _PaginaBibliotecaState();
}

class _PaginaBibliotecaState extends State<PaginaBiblioteca> {
  final bd = FirebaseFirestore.instance;
  Future<void> GetCollection() async {
    final genero = await bd.collection('comedia_').get();
    print(genero.docs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(onPressed: GetCollection, child: Text('Clique aqui'))
        ],
      ),
    ));
  }
}
