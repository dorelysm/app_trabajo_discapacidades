import 'package:flutter/material.dart';

class NatHomePage extends StatefulWidget {
  const NatHomePage({Key? key}) : super(key: key);

  @override
  State<NatHomePage> createState() => _NatHomePageState();
}

class _NatHomePageState extends State<NatHomePage> {
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
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
                onPressed: () {
                  _showLogin(context);
                },
                child: const Text('Consultas')),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
              //style: style,
                onPressed: () {
                  _showRegistro(context);
                },
                child: const Text('Mi perfil')),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
                //style: style,
                onPressed: () {
                  _showConsultas(context);
                },
                child: const Text('Opciones')),
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
