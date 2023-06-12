import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/cadastroUser.dart';
import 'app/login.dart';
import 'app/paginas/cadUser.dart';
import 'app/paginas/homeScreen.dart';
import 'app/paginas/livros.dart';
import 'app/paginas/updatecadUser.dart';

/*
import 'app/paginas/addbook.dart';
import 'app/paginas/addgender.dart';
import 'app/paginas/arealivros.dart';
import 'app/paginas/bookUser.dart';
*/
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
