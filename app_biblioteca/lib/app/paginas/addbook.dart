import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddLivro extends StatefulWidget {
  const AddLivro({super.key});

  @override
  State<AddLivro> createState() => _AddLivroState();
}

class _AddLivroState extends State<AddLivro> {
  final _formkey = GlobalKey<FormState>();
  //bool _emailValido = false;
  bool _formValido = false;
  TextEditingController folhas = TextEditingController();
  TextEditingController genero = TextEditingController();
  TextEditingController resumo = TextEditingController();
  TextEditingController titulo = TextEditingController();

  void _validacaoFormulario() {
    _formkey.currentState?.validate();
  }

  String _validarEntrada(String? mensagem) {
    if (mensagem == null || mensagem.isEmpty) {
      return 'Preencha o campo';
    } else {
      return 'Campo preenchido';
    }
  }

  @override
  void initState() {
    super.initState();
    folhas.addListener(_validacaoFormulario);
    genero.addListener(_validacaoFormulario);
    titulo.addListener(_validacaoFormulario);
    resumo.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    folhas.removeListener(_validacaoFormulario);
    genero.removeListener(_validacaoFormulario);
    titulo.removeListener(_validacaoFormulario);
    resumo.removeListener(_validacaoFormulario);
  }

  final db = FirebaseFirestore.instance;
  Future<void> AddLivro() async {
    final livro = <String, dynamic>{
      "folhas": "${folhas.text}",
      "genero": "${genero.text}",
      "resumo": "${resumo.text}",
      "titulo": "${titulo.text}"
    };
    db.collection('livros').add(livro).then(
          (DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                children: [
                  Icon(
                    Icons.bookmark_add,
                    size: 100,
                  ),
                  Text('Cadastrar Livro'),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: titulo,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: _formValido ? Colors.blue : Colors.red),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _formValido ? Colors.blue : Colors.red)),
                      labelText: "Titulo",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _formValido = value.isNotEmpty;
                      });
                    },
                    validator: _validarEntrada,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: resumo,
                    obscureText: false,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: _formValido ? Colors.blue : Colors.red),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _formValido ? Colors.blue : Colors.red)),
                      labelText: "Resumo",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _formValido = value.isNotEmpty;
                      });
                    },
                    validator: _validarEntrada,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: genero,
                    obscureText: false,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: _formValido ? Colors.blue : Colors.red),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _formValido ? Colors.blue : Colors.red)),
                      labelText: "Genero",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _formValido = value.isNotEmpty;
                      });
                    },
                    validator: _validarEntrada,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: folhas,
                    obscureText: false,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: _formValido ? Colors.blue : Colors.red),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _formValido ? Colors.blue : Colors.red)),
                      labelText: "Folhas",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _formValido = value.isNotEmpty;
                      });
                    },
                    validator: _validarEntrada,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: AddLivro,
                    child: Text('Cadastrar | Livro'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
