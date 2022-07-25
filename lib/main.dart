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
        "/": (BuildContext context) => const MyHomePage(),
        "/registro": (BuildContext context) => const RegistroPage(),
        "/registro_opc":(BuildContext context) => const RegistroOpcPage(),
        "/registro_nat":(BuildContext context) => const RegistroNatPage(),
        "/login":(BuildContext context) => const LoginPage(),
        "/consultas":(BuildContext context) => const ConsultasPage(),
      }
    );
  }
}

