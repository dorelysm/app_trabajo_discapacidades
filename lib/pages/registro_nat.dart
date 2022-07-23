import 'package:flutter/material.dart';

class RegistroNatPage extends StatelessWidget {
  const RegistroNatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de persona natural'),
        backgroundColor: Color(0xff0096C7),
      ),
      body: ListView(children: const <Widget>[
        Text(
          'Mis datos personales',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Rosario', fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg')),
        TextField(
          decoration: InputDecoration(
            labelText: 'Nombre',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Apellido',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Número de identificación',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Ciudad de residencia',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Número de celular',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Contraseña',
          ),
        ),
        ElevatedButton(onPressed: null, child: Text('Guardar'))
      ]),
    );
  }
}
