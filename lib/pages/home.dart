import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          const Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rosario',
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
          // Boton de Login
          ElevatedButton(
              onPressed: () {
                _showLogin(context);
              },
              child: const Text('Login')),
          //Boton de registro
          ElevatedButton(
              onPressed: () {
                _showRegistro(context);
              },
              child: const Text('Registro')),
          //Boton consultas
          ElevatedButton(
              onPressed: () {
                _showConsultas(context);
              },
              child: const Text('Consultas')),
        ]));
  }

  //Métodos de navegador
  void _showRegistro(BuildContext context) {
    Navigator.of(context).pushNamed("/registro");
  }

  void _showLogin(BuildContext context) {
    Navigator.of(context).pushNamed("/login");
  }

  void _showConsultas(BuildContext context) {
    Navigator.of(context).pushNamed("/consultas");
  }
}
