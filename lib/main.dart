import 'package:flutter/material.dart';
import 'package:trabajo_discapacidades/pages/consultas.dart';
import 'package:trabajo_discapacidades/pages/home.dart';
import 'package:trabajo_discapacidades/pages/login.dart';
import 'package:trabajo_discapacidades/pages/registro.dart';
import 'package:trabajo_discapacidades/pages/registro_nat.dart';
import 'package:trabajo_discapacidades/pages/registro_emp.dart';
import 'package:trabajo_discapacidades/pages/registro_opc.dart';
import 'package:trabajo_discapacidades/pages/consultas_empleos.dart';
import 'package:trabajo_discapacidades/pages/consultas_empresas.dart';
import 'package:trabajo_discapacidades/pages/emp_home.dart';
import 'package:trabajo_discapacidades/pages/nat_home.dart';
import 'package:trabajo_discapacidades/pages/nueva_vacante.dart';
import 'package:trabajo_discapacidades/pages/rec_home.dart';
import 'package:trabajo_discapacidades/pages/vacante.dart';
import 'package:trabajo_discapacidades/pages/nuevo_reclutador.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FindMe', //Nombre de la aplicación
        theme: ThemeData(
          //Temas
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xffEEF8FB),
          elevatedButtonTheme: ElevatedButtonThemeData(
            //Tema de los botones
            style: ElevatedButton.styleFrom(
                primary: const Color(0xff0096C7),
                textStyle: const TextStyle(
                  fontFamily: 'Rosario',
                  fontSize: 25,
                ),
                padding: const EdgeInsets.all(30),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
          ),
        ),
        //home: const MyHomePage(),

        //Rutas para la navegación entre páginas
        routes: {
          "/": (BuildContext context) => const MyHomePage(),
          "/emp_hom": (BuildContext context) => const EmpHomePage(),
          "/nat_hom": (BuildContext context) => const NatHomePage(),
          "/rec_hom": (BuildContext context) => const RecHomePage(),
          "/registro": (BuildContext context) => const RegistroPage(),
          "/registro_opc": (BuildContext context) => const RegistroOpcPage(),
          "/registro_nat": (BuildContext context) => const RegistroNatPage(),
          "/registro_emp": (BuildContext context) => const RegistroEmpPage(),
          "/login": (BuildContext context) => const LoginPage(),
          "/consultas": (BuildContext context) => const ConsultasPage(),
          "/consultas_empleos": (BuildContext context) =>
              const ConsultasEmpleosPage(),
          "/consultas_empresas": (BuildContext context) =>
              const ConsultasEmpresasPage(),
          "/vacante": (BuildContext context) => const vacantePage(),
          "/nueva_vacante": (BuildContext context) => const nuevaVacantePage(),
          "/nueva_reclutador": (BuildContext context) =>
              const nuevoReclutadorPage(),
        });
  }
}
