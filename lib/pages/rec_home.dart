import 'package:flutter/material.dart';

class RecHomePage extends StatefulWidget {
  const RecHomePage({Key? key}) : super(key: key);

  @override
  State<RecHomePage> createState() => _RecHomePageState();
}

class _RecHomePageState extends State<RecHomePage> {
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
              'RECLUTADORES HOME',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Rosario',
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
                onPressed: () {
                  //_showLogin(context);
                },
                child: const Text('Nueva oferta laboral')),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
              //style: style,
                onPressed: () {
                  //_showRegistro(context);
                },
                child: const Text('Modificar oferta laboral')),
          ),          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
                //style: style,
                onPressed: () {
                  //_showConsultas(context);
                },
                child: const Text('Mis ofertas laborales')),
          ),
          
        ]));
  }
}