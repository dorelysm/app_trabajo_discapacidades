import 'package:flutter/material.dart';

class RegistroOpcPage extends StatelessWidget {
  const RegistroOpcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones de registro'),
        backgroundColor: Color(0xff0096C7),
      ),
      body: ListView(children: <Widget>[
        const Text(
          'Registro',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Rosario', fontWeight: FontWeight.bold, fontSize: 40),
        ),
        ElevatedButton(
            onPressed: () {
              _showRegistroNat(context);
            },
            child: const Text("Correo electrónico")),
        const ElevatedButton(onPressed: null, child: Text("Google")),
        const ElevatedButton(onPressed: null, child: Text("Facebook")),
      ]),
    );
  }

  void _showRegistroNat(BuildContext context) {
    Navigator.of(context).pushNamed("/registro_nat");
  }
}
