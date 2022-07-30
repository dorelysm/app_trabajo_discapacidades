import 'package:flutter/material.dart';

class RegistroOpcPage extends StatelessWidget {
  const RegistroOpcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF8FB),
      appBar: AppBar(
        title: const Text('Opciones de registro'),
        backgroundColor: const Color(0xff0096C7),
      ),
      body: ListView(children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Text(
            'REGISTRO',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rosario',
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: ElevatedButton(
              onPressed: () {
                _showRegistroNat(context);
              },
              child: const Text("Correo electrónico")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: ElevatedButton(
              onPressed: () {
                _showRegistroOpc(context);
              },
              child: const Text("Google")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: ElevatedButton(
              onPressed: () {
                _showRegistroOpc(context);
              },
              child: const Text("Facebook")),
        ),
      ]),
    );
  }

  void _showRegistroNat(BuildContext context) {
    Navigator.of(context).pushNamed("/registro_nat");
  }

  void _showRegistroOpc(BuildContext context) {
    Navigator.of(context).pushNamed("/registro_opc");
  }
}
