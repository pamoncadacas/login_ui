// importamos los paquetes
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// creamos la clase getusername y hereda stateless
class GetUserName extends StatelessWidget {
  // creamos la variable tipo string llamada documentId
  final String documentId;
  // obligatoriamente tiene que tener el document id
  GetUserName({required this.documentId});
   // sobre escribimos
  @override
  Widget build(BuildContext context)  {
    // lee la coleccion
    CollectionReference users = FirebaseFirestore.instance.collection('cuentas');

    return FutureBuilder<DocumentSnapshot> (
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        // realiza la conexion a labase de datos
        if(snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          // si esta bien la conexion muestra los usuarios q estan inscritos
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Nombre Usuario: ${data['first name']} ${data['last name']}');
        }
        // mientras los muestra sale el mensaje cargando
        return const Text('cargando...');
      }),
    );
  }
}