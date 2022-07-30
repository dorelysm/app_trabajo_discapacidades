import 'package:flutter/material.dart';

class vacantePage extends StatefulWidget {
  vacantePage({Key? key}) : super(key: key);

  @override
  State<vacantePage> createState() => _vacantePageState();
}

class _vacantePageState extends State<vacantePage> {
  //Datos de prueba, reemplazar por datos extraidos de las consultas
  final nombreCargo = "Nombre del cargo";
  final nombreEmpresa = "Nombre de la empresa";
  final modalidad = "Modalidad";
  final salario = "123456 - 123456";
  final contrato = "Tipo de contrato";
  final descripcion =
      "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion ";
  final requerimientos =
      "Requerimientos Requerimientos Requerimientos Requerimientos Requerimientos Requerimientos Requerimientos Requerimientos ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: const Text('Vacante'),
        backgroundColor: const Color(0xff0096C7),
        
      ),
      body: ListView(children: <Widget>[
        Text(nombreCargo),
        Text(nombreEmpresa),
        Row(children: [
          const Text("Modalidad de trabajo"),
          Text(modalidad)
        ]),
        Row(children: [
          const Text("Rango salarial"),
          Text(salario)
        ]),
        Row(children: [
          const Text("Tipo de contrato"),
          Text(contrato)
        ]),

      ])
    );
=======
        backgroundColor: Color(0xffEEF8FB),
        appBar: AppBar(
          title: const Text('Vacante'),
          backgroundColor: const Color(0xff0096C7),
        ),
        body: ListView(children: <Widget>[
          Text(nombreCargo),
          Text(nombreEmpresa),
          Row(children: [const Text("Modalidad de trabajo"), Text(modalidad)]),
          Row(children: [const Text("Rango salarial"), Text(salario)]),
          Row(children: [const Text("Tipo de contrato"), Text(contrato)]),
        ]));
>>>>>>> 220b450c5d4840e0d53a354ba06a21637603b7a9
  }
}
