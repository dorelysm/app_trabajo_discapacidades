import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:trabajo_discapacidades/pages/consultas.dart';
import 'package:trabajo_discapacidades/pages/home.dart';
import 'package:trabajo_discapacidades/pages/login.dart';
import 'package:trabajo_discapacidades/pages/registro.dart';
import 'package:trabajo_discapacidades/pages/registro_nat.dart';
import 'package:trabajo_discapacidades/pages/registro_opc.dart';
import 'package:http/http.dart' as http;

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
          "/registro_opc": (BuildContext context) => const RegistroOpcPage(),
          "/registro_nat": (BuildContext context) => const RegistroNatPage(),
          "/login": (BuildContext context) => const LoginPage(),
          "/consultas": (BuildContext context) => const ConsultasPage(),
        });
  }
}

void peticion(List<String> arguments) {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  http.get(url).then((res) {});
  print(url);
}
