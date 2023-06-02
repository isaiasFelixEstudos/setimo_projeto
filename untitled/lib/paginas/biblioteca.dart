import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaginaBiblioteca extends StatefulWidget {
  const PaginaBiblioteca({Key? key}) : super(key: key);

  @override
  State<PaginaBiblioteca> createState() => _PaginaBibliotecaState();
}

class _PaginaBibliotecaState extends State<PaginaBiblioteca> {
  FirebaseFirestore restore = FirebaseFirestore.instance;
  List<String> listgeneros = [];
  Future<void> GetCollection() async {
    QuerySnapshot query = await restore.collection('generos').get();

    query.docs.forEach((doc) {
      String titulogenero = doc.get('titulo').get();
      setState(() {
        listgeneros.add(titulogenero);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listgeneros.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text('Genero: ' + listgeneros[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
