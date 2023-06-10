import 'package:flutter/material.dart';
import 'app/homeScreen.dart';
import 'app/cadUser.dart';
import 'app/login.dart';
import 'app/updatecadUser.dart';
import 'package:app_biblioteca/app/livros.dart';
import 'package:app_biblioteca/app/areaUsuario.dart';
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
        '/login': (_) => TelaDeLogin(),
        '/CadUser': (_) => PaginaDeCadastro(),
        '/areusuario': (_) => TelaLogada(),
        '/livros': (_) => PgLivros(),
        '/updateuser': (_) => UpdateCadUser(),
      },
    ),
  );
}
