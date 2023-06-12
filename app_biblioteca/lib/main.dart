import 'package:flutter/material.dart';
import 'app/homeScreen.dart';
import 'app/cadUser.dart';
import 'app/cadastroUser.dart';
import 'app/login.dart';
import 'app/updatecadUser.dart';
import 'package:app_biblioteca/app/livros.dart';
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
      initialRoute: '/login',
      routes: {
        '/home': (_) => HomeScreen(),
        '/login': (_) => TelaDeLogin(),
        '/CadUser': (_) => PaginaDeCadastro(),
        '/livros': (_) => PgLivros(),
        '/updateuser': (_) => UpdateCadUser(),
        '/cadUserfora': (_) => PaginaDeCadastrofora(),
      },
    ),
  );
}
