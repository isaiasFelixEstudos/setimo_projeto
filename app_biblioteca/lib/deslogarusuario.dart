import 'package:firebase_auth/firebase_auth.dart';

Future<void> deslogarFirebase() async {
  await FirebaseAuth.instance.signOut();
}
