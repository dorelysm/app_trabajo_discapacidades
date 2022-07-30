import 'package:flutter/material.dart';

class ConsultasEmpresasPage extends StatefulWidget {
  const ConsultasEmpresasPage({Key? key}) : super(key: key);

  @override
  State<ConsultasEmpresasPage> createState() => _ConsultasEmpresasPageState();
}

class _ConsultasEmpresasPageState extends State<ConsultasEmpresasPage> {
  final List<String> _DatosPrueba = [
    'Aerovias del continente americano s a avianca',
    'Supertiendas y droguerias olimpica olimpica s a',
    'C i blincaribe internacional colombia ltda',
    'Cementos argos s a',
    'Caja de compensacion familiar cajacopi',
    'Médico',
    'Programador',
    'Analista',
    'Secretario',
    'Contador',
    'GG',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Búsqueda de empresas'),
          backgroundColor: const Color(0xff0096C7),
        ),
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'BÚSQUEDA DE EMPRESAS',
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
                    labelText: 'Busca empresas',
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