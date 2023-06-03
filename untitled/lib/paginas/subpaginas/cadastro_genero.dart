import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroGenero extends StatefulWidget {
  const CadastroGenero({super.key});

  @override
  State<CadastroGenero> createState() => _CadastroGeneroState();
}

class _CadastroGeneroState extends State<CadastroGenero> {
  CollectionReference genero = FirebaseFirestore.instance.collection('generos');
  Future<void> addCollection() async {
    return genero.doc("comedia_romantica_").set({
      'descricao': 'genero novo',
      'indicacaoIdade': 'Livre',
      'titulo': 'Comédia ROmantica'
    });
    /*return genero.add({
      'descricao': 'genero novo',
      'indicacaoIdade': 'Livre',
      'titulo': 'Comédia ROmantica'
    }).then((value) => print('Genero Adicionado'));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: addCollection, child: Text('Adicionar coleção'))
        ],
      ),
    );
  }
}
