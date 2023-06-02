import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class CadastroGenero extends StatefulWidget {
  const CadastroGenero({Key? key}) : super(key: key);

  @override
  State<CadastroGenero> createState() => _CadastroGeneroState();
}

class _CadastroGeneroState extends State<CadastroGenero> {
  final _formKey = GlobalKey<FormState>();

  bool _formValido = false;
  TextEditingController _campoDescricao = TextEditingController();
  TextEditingController _campoIndicacaoIdade = TextEditingController();
  TextEditingController _campoTitulo = TextEditingController();

  void _validarFormulario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AddCollection();
    }
  }

  void AddCollection() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('generos').add({
      'descricao': _campoDescricao.text,
      'indicacaoIdade': _campoIndicacaoIdade.text,
      'titulo': _campoTitulo.text,
    }).then((value) {
      // Cadastro realizado com sucesso
      print('Informações cadastradas com sucesso!');
    }).catchError((error) {
      // Ocorreu um erro durante o cadastro
      print('Erro ao cadastrar as informações: $error');
    });
  }

  String? _validarEntrada(String? mensagem) {
    if (mensagem == null || mensagem.isEmpty) {
      return 'Preencha o campo';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _campoDescricao.addListener(_validarFormulario);
    _campoIndicacaoIdade.addListener(_validarFormulario);
    _campoTitulo.addListener(_validarFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _campoIndicacaoIdade.removeListener(_validarFormulario);
    _campoDescricao.removeListener(_validarFormulario);
    _campoTitulo.removeListener(_validarFormulario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text('Área de Cadastro de Gêneros de Livros'),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _campoTitulo,
                        decoration: InputDecoration(labelText: 'Título'),
                        validator: _validarEntrada,
                        onChanged: (value) {
                          setState(() {
                            _formValido = value.isNotEmpty;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _campoDescricao,
                        decoration:
                            InputDecoration(labelText: 'Descrição do gênero'),
                        validator: _validarEntrada,
                        onChanged: (value) {
                          setState(() {
                            _formValido = value.isNotEmpty;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _campoIndicacaoIdade,
                        decoration:
                            InputDecoration(labelText: 'Indicação de idade'),
                        validator: _validarEntrada,
                        onChanged: (value) {
                          setState(() {
                            _formValido = value.isNotEmpty;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _validarFormulario,
                  child: Text('Cadastrar Gênero'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
