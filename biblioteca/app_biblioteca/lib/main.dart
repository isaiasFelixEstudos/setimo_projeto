import 'package:flutter/material.dart';
import 'app/homescreen.dart';
import 'app/paginas/pg_adduser.dart';
import 'app/paginas/pg_loginuser.dart';
import 'app/paginas/pg_addlivroegenero.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (_) => HomeScreen(),
        '/cadastroUsuario': (_) => PaginaDeCadastro(),
        '/teladelogin': (_) => TelaDeLogin(),
        '/cadastrolicroegenero': (_) => CadastrarGeneroLivro(),
      },
    ),
  );
}
