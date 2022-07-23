import 'package:flutter/material.dart';
import 'package:trabajo_discapacidades/pages/consultas.dart';
import 'package:trabajo_discapacidades/pages/home.dart';
import 'package:trabajo_discapacidades/pages/login.dart';
import 'package:trabajo_discapacidades/pages/registro.dart';
import 'package:trabajo_discapacidades/pages/registro_nat.dart';
import 'package:trabajo_discapacidades/pages/registro_opc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Búsqueda de empleo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(),
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/registro": (BuildContext context) => RegistroPage(),
        "/registro_opc":(BuildContext context) => RegistroOpcPage(),
        "/registro_nat":(BuildContext context) => RegistroNatPage(),
        "/login":(BuildContext context) => LoginPage(),
        "/consultas":(BuildContext context) => ConsultasPage(),
      }
    );
  }
}

