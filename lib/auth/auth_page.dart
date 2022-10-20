// importamos los paquetes de material
// importamos las paginas que necesitamos
import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/register_page.dart';

// creamos la clase heredado de statefull que permite hacer cambios
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
// sobreescribimos
  @override
  State<AuthPage> createState() => _AuthPageState();
}
// creamos la clase authpage hereda del widget que sobreescribimos

class _AuthPageState extends State<AuthPage> {
  // inicialmente se muestra la pagina de loginPage()
  bool showLoginPage = true;

  // metodo para alternar pantallas
  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build (BuildContext context) {
    if(showLoginPage) {
      // si showloginpage esta en true se retorna loginpage
      return LoginPage(showRegisterPage: toggleScreens);
     // si no retornamos el registerpage
    }else{
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}