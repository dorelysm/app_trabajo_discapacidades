import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color(0xff0096C7),
        
      ),

      body: ListView(children: const <Widget>[
        Text(
          'Home',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Rosario',
            fontWeight: FontWeight.bold,
            fontSize: 40),
          ),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usuario',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
            ),
          ),

          ElevatedButton(onPressed: null, child: Text('Ingresar')),
          ElevatedButton(onPressed: null, child: Text('Inicia sesión con Google')),
          ElevatedButton(onPressed: null, child: Text('Inicia sesión con Facebook')),

      ])
    );
  }
}