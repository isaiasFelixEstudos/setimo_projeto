import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class CadastroGenero extends StatefulWidget {
  const CadastroGenero({super.key});

  @override
  State<CadastroGenero> createState() => _CadastroGeneroState();
}

class _CadastroGeneroState extends State<CadastroGenero> {
  final _formkey = GlobalKey<FormState>();

  bool _formValido = false;
  TextEditingController _campodescricao = TextEditingController();
  TextEditingController _campoindicacaoidade = TextEditingController();
  TextEditingController _campotitulo = TextEditingController();

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
    _campodescricao.addListener(_validacaoFormulario);
    _campoindicacaoidade.addListener(_validacaoFormulario);
    _campotitulo.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _campoindicacaoidade.removeListener(_validacaoFormulario);
    _campodescricao.removeListener(_validacaoFormulario);
    _campotitulo.removeListener(_validacaoFormulario);
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
                Text('Área de Cadastro de Generos de Livros'),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _campotitulo,
                  decoration: InputDecoration(labelText: 'Titulo'),
                  onChanged: (value) {
                    setState(
                      () {
                        _formValido = value.isNotEmpty;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _campodescricao,
                  decoration: InputDecoration(labelText: 'Descrição do genero'),
                  onChanged: (value) {
                    setState(
                      () {
                        _formValido = value.isNotEmpty;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _campoindicacaoidade,
                  decoration: InputDecoration(labelText: 'Indicação idade'),
                  onChanged: (value) {
                    setState(
                      () {
                        _formValido = value.isNotEmpty;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {}, child: Text('Cadastrar Genero'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
