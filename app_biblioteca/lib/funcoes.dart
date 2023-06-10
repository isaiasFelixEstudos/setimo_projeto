import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_biblioteca/app/areaUsuario.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> logarBase(String emailAddress, String password) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: emailAddress, password: password);
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
  if (user != null) {}
}
