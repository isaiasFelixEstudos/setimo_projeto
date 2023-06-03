import 'package:flutter/material.dart';
import 'app/homescreen.dart';
import 'app/paginas/pg_adduser.dart';
import 'app/paginas/pg_loginuser.dart';
import 'app/paginas/pg_addlivroegenero.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
        '/cadastrolicroegenero': (_) => CadastrarGeneroLivro(),
      },
    ),
  );
}
