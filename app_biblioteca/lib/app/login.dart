import 'package:app_biblioteca/funcoes.dart';
import 'package:app_biblioteca/appBar.dart';
import 'package:app_biblioteca/drawer.dart';
import 'package:flutter/material.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({Key? key}) : super(key: key);

  @override
  State<TelaDeLogin> createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  final _formkey = GlobalKey<FormState>();

  bool _formValido = false;
  TextEditingController _emailvalido = TextEditingController();
  TextEditingController _senhavalida = TextEditingController();

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
      appBar: CustomAppBar(title: 'Login'),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text('Login App'),
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
                          color: _formValido ? Colors.blue : Colors.red),
                    ),
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
                  onPressed: () {
                    logarBase(_emailvalido.text, _senhavalida.text);
                  },
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 2,
                ),
                ElevatedButton(
                  onPressed: logarGoogle,
                  child: Text('Login - google'),
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
