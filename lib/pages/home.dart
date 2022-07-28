import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /*
    final ButtonStyle style = 
      ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 30,
          fontFamily: 'Rosario',
        ),
        //backgroundColor: MaterialStateProperty.all(const Color(0xff0096C7))
      );
      */
    return Scaffold(
        backgroundColor: const Color(0xEEF8FB),
        body: ListView(children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'HOME',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Rosario',
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ),
          // Boton de Login
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: ElevatedButton(
                onPressed: () {
                  _showLogin(context);
                },
                child: const Text('Login')),
          ),
          //Boton de registro
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: ElevatedButton(
              //style: style,
                onPressed: () {
                  _showRegistro(context);
                },
                child: const Text('Registro')),
          ),
          //Boton consultas
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: ElevatedButton(
                //style: style,
                onPressed: () {
                  _showConsultas(context);
                },
                child: const Text('Consultas')),
          ),
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
