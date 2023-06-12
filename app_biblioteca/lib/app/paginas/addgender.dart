import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddGenero extends StatefulWidget {
  const AddGenero({super.key});

  @override
  State<AddGenero> createState() => _AddGeneroState();
}

class _AddGeneroState extends State<AddGenero> {
  final _formkey = GlobalKey<FormState>();
  //bool _emailValido = false;
  bool _formValido = false;
  TextEditingController descricao = TextEditingController();
  TextEditingController indicacaoIdade = TextEditingController();
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
    descricao.addListener(_validacaoFormulario);
    indicacaoIdade.addListener(_validacaoFormulario);
    titulo.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    descricao.removeListener(_validacaoFormulario);
    indicacaoIdade.removeListener(_validacaoFormulario);
    titulo.removeListener(_validacaoFormulario);
  }

  final db = FirebaseFirestore.instance;
  Future<void> FuncAddGenero() async {
    final livro = <String, dynamic>{
      "descricao": "${descricao.text}",
      "indicacaoIdade": "${indicacaoIdade.text}",
      "titulo": "${titulo.text}"
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
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                Center(
                  child: Text('Cadastro de Genero'),
                ),
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
                  controller: indicacaoIdade,
                  obscureText: false,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red)),
                    labelText: "Idade Recomendada",
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
                  controller: descricao,
                  obscureText: false,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red)),
                    labelText: "Descrição",
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
                  onPressed: FuncAddGenero,
                  child: Text('Cadastrar | Genero'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
