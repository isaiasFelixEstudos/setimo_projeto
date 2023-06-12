import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

class PaginaDeCadastrofora extends StatefulWidget {
  const PaginaDeCadastrofora({Key? key}) : super(key: key);

  @override
  State<PaginaDeCadastrofora> createState() => _PaginaDeCadastroforaState();
}

class _PaginaDeCadastroforaState extends State<PaginaDeCadastrofora> {
  final _formkey = GlobalKey<FormState>();
  //bool _emailValido = false;
  bool _formValido = false;
  TextEditingController _emailvalido = TextEditingController();
  TextEditingController _senhavalida = TextEditingController();

  void _validacaoFormulario() {
    _formkey.currentState?.validate();
  }

  Future<void> cadastrarBase() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailvalido.text, password: _senhavalida.text);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            content: Text('Usuario Cadastrado com Sucesso'),
          );
        });
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
    _emailvalido.addListener(_validacaoFormulario);
    _senhavalida.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _emailvalido.removeListener(_validacaoFormulario);
    _senhavalida.removeListener(_validacaoFormulario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de usuário')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                Icon(
                  Icons.supervised_user_circle,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text('Cadastro de usuário'),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailvalido,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red)),
                    labelText: "Email",
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
                  controller: _senhavalida,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: _formValido ? Colors.blue : Colors.red),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red)),
                    labelText: "Senha",
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
                  onPressed: cadastrarBase,
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
