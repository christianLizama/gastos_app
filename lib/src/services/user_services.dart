import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('pruebas');

  Future<void> addUser({
    required String dato1,
    required String dato2,
  }) 
  
  async {
    try {
      // Agregar datos a la colección 'users' en Firestore
      await usersCollection.add({
        'dato1': dato1,
        'dato2': dato2,
      });
    } catch (e) {
      print('Error al agregar usuario a Firebase: $e');
      // Puedes manejar el error según tus necesidades
    }
  }
}
