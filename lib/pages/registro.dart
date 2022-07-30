import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF8FB),
      appBar: AppBar(
        title: const Text('Registro'),
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
                _showRegistroOpc(context);
              },
              child: const Text('Busco empleo')),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: ElevatedButton(
              onPressed: () {
                _showRegistroEmp(context);
              },
              child: const Text('Quiero publicar un empleo')),
        )
      ]),
    );
  }

  //Métodos de navegador
  void _showRegistroEmp(BuildContext context) {
    Navigator.of(context).pushNamed("/registro_emp");
  }

  void _showRegistroOpc(BuildContext context) {
    Navigator.of(context).pushNamed("/registro_opc");
  }
}
