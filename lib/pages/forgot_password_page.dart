// se importa los paquetes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// se crea la clase forgot hereda de un stateful
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
// se sobreescribe
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}
// se crea la clase y se hereda de la que se sobreescribio
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
// cremos la variable email
  final _emailController = TextEditingController();


  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    Future passwordReset() async {
      final cuentaEmail = _emailController.text.trim();
      try{
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: cuentaEmail);
        showDialog<void>(
          context: context,
          barrierDismissible: true,
          // false = user must tap button, true= tap outside dialog
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              backgroundColor: Colors.purple[200],
              title: const Text('Recuperacion de contraseña'),
              content: Text('Un email fue enviado a la cuenta $cuentaEmail'),
              actions: <Widget>[
                TextButton(
                  child:  const Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // dismiss alert dialog
                  },
                )
              ],
            );
          }
        );
      }
      // se muestran los errores que puedan salir de firebase
      on FirebaseAuthException catch(e) {
        print(e);
        showDialog <void> (context: context, barrierDismissible: true, builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Firebase error', style: GoogleFonts.handlee(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            content : Text('Email error: $e', style: GoogleFonts.handlee(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            actions: <Widget>[
              TextButton(
                child: Text('Cerrar', style: GoogleFonts.handlee(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                onPressed: (){
                  Navigator.of(dialogContext).pop(); // dismiss alert dialog
                },
              )
            ],
          );
        });
      }
    }
    return Scaffold(
      // retorna un scaffold
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      // se muestra un column
      body:  Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Ingrese su email para el restablecimiento de contraseña',
              textAlign: TextAlign.center,
              style: GoogleFonts.handlee(
                color: Colors.black,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12)
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true
              ),
            ),
          ),
          const SizedBox(height: 10,),
          MaterialButton(
            onPressed: passwordReset,
            color: Colors.deepPurple[200],
            child:  Text(
              'Restablecer contraseña',
              style: GoogleFonts.handlee(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )
            ),
          )
        ],
      ),
    );
  }
}
