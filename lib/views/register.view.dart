import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordAgain =
      TextEditingController();

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _submitButton(context) {
    return ElevatedButton(
        onPressed: () async {
            Navigator.pushReplacementNamed(context, '/topsongs');
        },
        child: const Text('Register'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            _entryField('password again', _controllerPasswordAgain),
            // _errorMessage(),
            _submitButton(context),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/login');
            }, child: const Text('Already have an account'))
          ],
        ),
      ),
    );
  }
}