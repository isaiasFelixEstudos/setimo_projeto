import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddLivro extends StatefulWidget {
  const AddLivro({super.key});

  @override
  State<AddLivro> createState() => _AddLivroState();
}

class _AddLivroState extends State<AddLivro> {
  final db = FirebaseFirestore.instance;
  Future<void> AddLivro() async {
    final livro = <String, dynamic>{
      "descricao": "Genero teste",
      "indicacaoIdade": "Livre",
      "titulo": "genero teste"
    };
    db.collection('generos').add(livro).then(
          (DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: AddLivro, child: Text('Adicionar Livro'))
        ],
      ),
    );
  }
}
