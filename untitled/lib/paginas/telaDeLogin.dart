import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({Key? key}) : super(key: key);

  @override
  State<TelaDeLogin> createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  final _formkey = GlobalKey<FormState>();
  //bool _emailValido = false;
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

  Future<void> logarBase() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailvalido.text, password: _senhavalida.text);
    Navigator.of(context).pushNamed('/telalogada');

  }

  Future<void> logarGoogle() async {
    final GoogleSignIn googleSignIn = await GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    print(googleAuth?.idToken); // should not be null or empty
    print(googleAuth?.accessToken); // should not be null or empty

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = authResult.user;

    //customMaterialBanner(context, 'Logado com sucesso!', Colors.green);
    if (user != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/homeLogin', (Route<dynamic> route) => false);
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
      appBar: AppBar(
        title: Center(child: Text('Tela de login')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
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
                  onPressed: logarBase,
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastroUsuario');
                  },
                  child: Text('Criar cadastro'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
