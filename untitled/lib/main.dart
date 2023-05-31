import 'package:flutter/material.dart';
import 'package:untitled/firebase_options.dart';
import 'homeScreen.dart';
import 'paginas/cadastroUsuario.dart';
import 'paginas/telaDeLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'paginas/telaLogada.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (_) => HomeScreen(),
        '/cadastroUsuario': (_) => PaginaDeCadastro(),
        '/teladelogin': (_) => TelaDeLogin(),
        '/telalogada':(_) => TelaLogada(),
      },
    ),
  );
}
