// importamos los paquetes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import 'auth_page.dart';
// creamos la clase mainpage
class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);
// sobreescribimos
  @override
  State<MainPage> createState() => _MainPageState();
}
// se crea la clase mainpagestate
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // se retorna un scaffold
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            // se retorna la pagina homePage
            return const HomePage();
          } else {
            // retornamos la pagina AuthPage
            return const AuthPage();
          }
        }
      ),
    );
  }
}