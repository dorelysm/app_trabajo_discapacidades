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
          //Boton de User
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usuario',
            ),
          ),
          //Boton de Password
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
            ),
          ),
          //Boton de Ingresar
          ElevatedButton(onPressed: null, child: Text('Ingresar')),
          //Boton de Iniciar sesión con Google
          ElevatedButton(
              onPressed: null, child: Text('Inicia sesión con Google')),
          //Boton de Iniciar con Meta
          ElevatedButton(
              onPressed: null, child: Text('Inicia sesión con Facebook')),
        ]));
  }
}
