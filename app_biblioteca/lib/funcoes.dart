import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_biblioteca/app/areaUsuario.dart';

Future<void> logarBase(String emailAddress, String password) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: emailAddress, password: password);
}
