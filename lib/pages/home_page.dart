// se importa los paquetes
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/get_user_name.dart';
// se crea la clase homepage
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
// sobreescribe
  @override
  State<HomePage> createState() => _HomePageState();
}
// creamos la clase que hereda de la clase que sobreescribimos
class _HomePageState extends State<HomePage> {
  // creamos una variable user
  final user = FirebaseAuth.instance.currentUser!;

  // lista de identificadores de documentos (ID Documents :: FireStore)
  List<String> docIds = [];

  // get docIds :: metodo para obtener la lista de identificadores de documentos
  Future getDocId() async {
    // muestra las cuentas q estan en la base de datos registradas
    await FirebaseFirestore.instance
        .collection('cuentas')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document
                  .reference); // imprime lista de documentos en la consola
              docIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    // retorna un scaffold
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title:  Center(
          child:  Text(
            'Inicio Sesion! ${user.email!}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        // rmuestra una columna
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FutureBuilder(
                    future: getDocId(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          itemCount: docIds.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: GetUserName(documentId: docIds[index]),
                                tileColor: Colors.grey[200],
                              ),
                            );
                          });
                    }))
          ],
        ),
      ),
    );
  }
}
