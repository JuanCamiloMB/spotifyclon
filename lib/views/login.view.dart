import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // Screen title
  Widget _title() {
    return const Text(
      'Spotify',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // text email and password
  Widget _entryField(String hint, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54, // Fondo oscuro para los campos de texto
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword, // Oculta el texto si es un campo de contraseña
        style: const TextStyle(color: Colors.white), // Texto blanco
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white60),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  // LogIn button
  Widget _submitButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Colors.greenAccent, Colors.green],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, 
          shadowColor: Colors.transparent, 
        ),
        onPressed: () async {
          Navigator.pushNamed(context, '/topsongs');
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Iniciar sesión',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Sign Up button
  Widget _registerButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/register');
      },
      child: const Text(
        'Registrate',
        style: TextStyle(color: Colors.greenAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR753t7b4IBzrmcE0bCtWcM0wZXVg2z4S9Aag&s',
              height: 100,
            ),
            const SizedBox(height: 20),
            _title(),
            const SizedBox(height: 40), // Espacio entre el título y los campos
            _entryField('usuario', _controllerEmail),
            const SizedBox(height: 20), // Espacio entre campos
            _entryField('Contraseña', _controllerPassword, isPassword: true),
            const SizedBox(height: 30),
            _submitButton(context),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'No tienes una cuenta? ',
                  style: TextStyle(color: Colors.white60),
                ),
                _registerButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
