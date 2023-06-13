import 'package:app_biblioteca/app/paginas/arealivros.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_biblioteca/ferramentas/appBar.dart';
import 'package:app_biblioteca/ferramentas/drawer.dart';

class RepoLivro extends StatelessWidget {
  const RepoLivro({Key? key}) : super(key: key);

  Future<void> emprestarLivro(String livroId) async {
    await FirebaseFirestore.instance
        .collection('livros')
        .doc(livroId)
        .update({'emprestado': true});
  }

  Future<void> devolverLivro(String livroId) async {
    await FirebaseFirestore.instance
        .collection('livros')
        .doc(livroId)
        .update({'emprestado': false});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Livros'),
      drawer: CustomDrawer(),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('livros').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final livros = snapshot.data!.docs;

            return ListView.builder(
              itemCount: livros.length,
              itemBuilder: (context, index) {
                final livro = livros[index].data();
                final livroId = livros[index].id;
                final bool emprestado = livro['emprestado'] ?? false;

                return Card(
                  child: ListTile(
                    title: Text(livro['titulo']?.toString() ?? ''),
                    subtitle: Text(livro['resumo']?.toString() ?? ''),
                    trailing:
                        emprestado ? Text('Emprestado') : Text('Disponível'),
                    onTap: () {
                      if (emprestado) {
                        devolverLivro(livroId);
                      } else {
                        emprestarLivro(livroId);
                      }
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar os livros');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
