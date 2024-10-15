import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordAgain = TextEditingController();

  // email and password
  Widget _entryField(String hint, TextEditingController controller, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54, // Fondo oscuro para los campos de texto
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword, // Oculta el texto si es un campo de contraseña
        style: const TextStyle(color: Colors.white), 
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white60),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  // Botón de registro
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
            'Registrarse',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Botón para ir a la pantalla de login
  Widget _loginButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: const Text(
        'Ya tienes una cuenta? Inicia sesión',
        style: TextStyle(color: Colors.greenAccent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Container(
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
            const Text(
              'Regístrate en Spotify',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            _entryField('Correo electrónico', _controllerEmail),
            const SizedBox(height: 20),
            _entryField('Contraseña', _controllerPassword, isPassword: true),
            const SizedBox(height: 20),
            _entryField('Repetir contraseña', _controllerPasswordAgain, isPassword: true),
            const SizedBox(height: 30),
            _submitButton(context),
            const SizedBox(height: 20),
            _loginButton(context),
          ],
        ),
      ),
    );
  }
}
