import 'package:flutter/material.dart';

class ConsultasEmpleosPage extends StatefulWidget {
  const ConsultasEmpleosPage({Key? key}) : super(key: key);
  @override
  State<ConsultasEmpleosPage> createState() => _ConsultasEmpleosPageState();
}

class _ConsultasEmpleosPageState extends State<ConsultasEmpleosPage> {
  // Datos de prueba, reemplazar por los consultados en DB
  final List<String> _DatosPrueba = [
    'Ingeniero',
    'Abogado',
    'Enfermero',
    'Periodista',
    'Diseñador',
    'Médico',
    'Programador',
    'Analista',
    'Secretario',
    'Contador',
    'Gerente',
  ];

  //Colocar aquí las consultas
  void _Consultar() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEEF8FB),
        appBar: AppBar(
          title: const Text('Búsqueda de empleos'),
          backgroundColor: const Color(0xff0096C7),
        ),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'BÚSQUEDA DE EMPLEOS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Rosario',
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFF000000))),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Busca ofertas laborales',
                    //border: OutlineInputBorder(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {
                          _Consultar();
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Card(
                    elevation: 10,
                    color: const Color(0xff022C64),
                    child: ListTile(
                      leading: const CircleAvatar(),
                      title: Text(
                        _DatosPrueba[index],
                        style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        _DatosPrueba[index],
                        style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: _DatosPrueba.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            )
          ],
        ));
  }
}
