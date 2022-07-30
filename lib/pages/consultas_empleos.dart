import 'package:flutter/material.dart';

class ConsultasEmpleosPage extends StatefulWidget {
  const ConsultasEmpleosPage({Key? key}) : super(key: key);
  @override
  State<ConsultasEmpleosPage> createState() => _ConsultasEmpleosPageState();
}

class _ConsultasEmpleosPageState extends State<ConsultasEmpleosPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEEF8FB),
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
              child: const TextField(
                decoration: InputDecoration(
                    labelText: 'Busca ofertas laborales',
                    //border: OutlineInputBorder(),
                    icon: Icon(Icons.search)),
              ),
            ),
            ListView.builder(
              itemBuilder: (BuildContext, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  child: Card(
                    elevation: 10,
                    color: const Color(0xff0096C7),
                    child: ListTile(
                      leading: const CircleAvatar(),
                      title: Text(_DatosPrueba[index]),
                      subtitle: const Text("This is subtitle"),
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
