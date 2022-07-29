import 'package:flutter/material.dart';

class ConsultasPage extends StatefulWidget {
  const ConsultasPage({Key? key}) : super(key: key);

  @override
  State<ConsultasPage> createState() => _ConsultasPageState();
}

class _ConsultasPageState extends State<ConsultasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
        backgroundColor: const Color(0xff0096C7),
      ),
      body: ListView(children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Text('CONSULTAS',
          textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Rosario',
                    fontWeight: FontWeight.bold,
                    fontSize: 50),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
          child: ElevatedButton(onPressed: () {
            _showConsultasEmpleos(context);
          }, child: const Text("Buscar empleos")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
          child: ElevatedButton(onPressed: () {
            _showConsultasEmpresas(context);
          }, child: const Text("Buscar empresas")),
        ),
      ],),
    );
  }
}

  //Métodos de navegador
  void _showConsultasEmpleos(BuildContext context) {
    Navigator.of(context).pushNamed("/consultas_empleos");
  }
  void _showConsultasEmpresas(BuildContext context) {
    Navigator.of(context).pushNamed("/consultas_empresas");
  }