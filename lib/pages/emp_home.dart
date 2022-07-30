import 'package:flutter/material.dart';

class EmpHomePage extends StatefulWidget {
  const EmpHomePage({Key? key}) : super(key: key);

  @override
  State<EmpHomePage> createState() => _EmpHomePageState();
}

class _EmpHomePageState extends State<EmpHomePage> {
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
        backgroundColor: Color(0xffEEF8FB),
        body: ListView(children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'EMPRESA',
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
                child: const Text('Actualizar datos de la empresa')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
                //style: style,
                onPressed: () {
                  //_showRegistro(context);
                },
                child: const Text('Ver vacantes')),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'RECLUTADORES',
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
                //style: style,
                onPressed: () {
                  //_showConsultas(context);
                },
                child: const Text('Agregar reclutador')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: ElevatedButton(
                //style: style,
                onPressed: () {
                  //_showConsultas(context);
                },
                child: const Text('Eliminar reclutador')),
          ),
        ]));
  }
}
