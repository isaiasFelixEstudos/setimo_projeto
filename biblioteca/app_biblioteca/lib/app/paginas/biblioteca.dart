import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({super.key});

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  Future<void> getColecao() async {
    final db = FirebaseFirestore.instance;
    final generos = db.collection('generos').doc('comedia_');
    generos.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
    }, onError: (e) => print('Erro'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColecao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: getColecao, child: Text('Listar generos'))
        ],
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({Key? key});

  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  List<DocumentSnapshot> _dataList = [];
  Future<void> _fetchData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('generos').get();
    setState(() {
      _dataList = snapshot.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _dataList.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> data =
                _dataList[index].data() as Map<String, dynamic>;
            String titulo = data['titulo'];
            String descricao = data['descricao'];
            return ListTile(
              title: Text(titulo),
              subtitle: Text(descricao),
            );
          },
        ),
      ),
    );
  }
}
*/