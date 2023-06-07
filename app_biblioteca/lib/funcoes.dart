import 'package:cloud_firestore/cloud_firestore.dart';

List<String> rota = ['/home'];
List<String> texto = ['Home'];

List<String> colecao = [];

void consultarColecao() async {
  try {
    CollectionReference colecaoRef =
        FirebaseFirestore.instance.collection('textandroute');
    QuerySnapshot snapshot = await colecaoRef.get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      // Faça algo com os dados
      print(data);
      final dicio = {
        'drawerrout': data['routeDrawer'].toString(),
        'drawertext': data['textDrawer'].toString(),
      };
      colecao.addAll(dicio.values.toList().cast<String>());
    }
  } catch (e) {
    print('Erro ao consultar a coleção: $e');
  }
}
