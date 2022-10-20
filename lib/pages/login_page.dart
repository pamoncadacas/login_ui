// importamos los paquetes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgot_password_page.dart';
// creamos la clase que hereda de stateful
class LoginPage extends StatefulWidget{
  // creamos la variable
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);
// sobreescribimos
  @override
  State<LoginPage> createState() => _LoginPageState();
}
// creamos la clase loginPageState hereda de la clase que sobre escribimos
class _LoginPageState extends State<LoginPage>{
  // creamos la variable para el email y password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    // retornamos un scaffold
    return Scaffold(
      // ponemos el color del background
      backgroundColor: Colors.purple[200],
      // ponemos una safeArea
      body: SafeArea(
        // centramos todo
        child: Center(
          // agregamos un scroll
          child: SingleChildScrollView(
            // mostramos una columna
            child: Column(
              // la centramos
              mainAxisAlignment: MainAxisAlignment.center,
              // children nos permite tener varios widgets
              children: [
                // mostramos un icon
                const Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                  color: Colors.white,
                ),
                // mostramos size box
                const SizedBox(height: 55),
                Text('¡Hola Aprendiz!',
                  style: GoogleFonts.rubikMoonrocks(
                    fontSize: 50,
                  )
                ),
                const SizedBox(height: 10),
                Text(
                  'Bienvenido de nuevo, lo hemos extrañado',
                  style:  GoogleFonts.handlee(
                    fontSize: 25,
                  )
                ),
                const SizedBox(height: 20),
                // agregamos un padding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        // inicializamos la variable q creamos al principio
                        controller:  _emailController,
                        obscureText: false,
                        // ponemos la decoracion
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Email',
                          fillColor: Colors.grey[200],
                          filled: true
                        ),
                      ),
                    ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: TextField(
                     controller: _passwordController,
                     obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Password',
                          fillColor: Colors.grey[200],
                          filled: true
                        ),
                   ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // le ponemos interaccion para navegar de una pagina  a otra
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const ForgotPasswordPage();
                          }));
                        },
                        child: const Text('¿Olvido la contraseña?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                    onTap: logIn, // metodo que gestiona el inicio de sesion
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Iniciar Sesion',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      '¿No Tiene Cuenta?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                       child: const Text(
                        '¡Registrese ahora!',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    )
                  ],
                )
              ],
            ),
         ),
       ),
     )
    );
  }
}