import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Color(0xff0096C7),
        
      ),
      body: ListView(children: <Widget>[
        const Text(
          'Registro',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Rosario',
            fontWeight: FontWeight.bold,
            fontSize: 40),
          ),
          ElevatedButton(onPressed: () {
            _showRegistroOpc(context);
          }, child: const Text('Busco empleo')),
          const ElevatedButton(onPressed: null, child: Text('Quiero publicar un empleo'))
      ]),
    );
  }
  
  void _showRegistroOpc(BuildContext context) {
    Navigator.of(context).pushNamed("/registro_opc");
  }
}