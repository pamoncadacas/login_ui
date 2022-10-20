// se importa los paquetes
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
// se crea la clase registerpage
class RegisterPage extends StatefulWidget {
  // se crea la vriable voidCallBack
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

// sobre escribimos
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
// se crea la clase de registerPage
class _RegisterPageState extends State<RegisterPage> {
 // text controllers
  // se crea las variables
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userProfileController = TextEditingController();

  Future sigIn() async {
    // se confirma la contraseña
    if(passwordConfirmed()) {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
      );
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _userProfileController.text.trim(),
        _emailController.text.trim()
      );
    }
  }
  Future addUserDetails(
      String firstName,
      String lastName,
      String userProfile,
      String email
      ) async {
    await FirebaseFirestore.instance.collection('cuentas').add({
      'first name' : firstName,
      'last name' : lastName,
      'user profile' : userProfile,
      'email' : email
    });
  }
  // funcion booleana que verifica si los dos controllers contienen el mismo dato
  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _userProfileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                 const SizedBox (height: 10),
                Text(
                  '¡Hola Aprendiz!',
                  style: GoogleFonts.rubikMoonrocks(
                    fontSize: 60,
                  )
                ),
                const SizedBox(height: 10),
                Text(
                  'Registre sus datos a continuacion',
                  style: GoogleFonts.handlee(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  )
                ),
                const SizedBox(height: 40),
                // testfield first name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'First Name',
                      fillColor: Colors.grey[200],
                      filled: true
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // testfield last name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Last Name',
                        fillColor: Colors.grey[200],
                        filled: true
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // testfield user
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _userProfileController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'User Profile',
                        fillColor: Colors.grey[200],
                        filled: true
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // testfield email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // testfield password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
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
                // confirm password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'Confirm Password',
                      fillColor: Colors.grey[200],
                      filled: true
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // button inicio
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                    onTap: sigIn, // metodo que gestiona el inicio de sesion
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Registrarse ahora',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¡Soy miembro!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        'Iniciar Sesion',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }


}