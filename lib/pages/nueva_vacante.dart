import 'package:flutter/material.dart';

class nuevaVacantePage extends StatefulWidget {
  const nuevaVacantePage({Key? key}) : super(key: key);

  @override
  State<nuevaVacantePage> createState() => _nuevaVacantePageState();
}

class _nuevaVacantePageState extends State<nuevaVacantePage> {

  GlobalKey<FormState> keyForm = GlobalKey();

  TextEditingController nombreTextController = TextEditingController();
  TextEditingController modalidadTextController = TextEditingController();
  TextEditingController tipoContratoTextController = TextEditingController();
  TextEditingController rangoSalarialTextController = TextEditingController();
  TextEditingController descripcionTextController = TextEditingController();
  TextEditingController requerimientosTextController = TextEditingController();

//Validaciones

  String? validarEntradaTexto(value) {
    if (value == null || value.isEmpty) {
      return "Campo obligatorio";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Crear vacante'),
          backgroundColor: const Color(0xff0096C7),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: keyForm,
            child: formularioCreacionVacante(),
          ),
        ),
      ) 
    );
  }
  
  Widget formularioCreacionVacante() {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Creación de vacante',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rosario',
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Nombre del cargo',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Modalidad de trabajo',
              border: OutlineInputBorder(),
            ),
            //validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Tipo de contrato',
              border: OutlineInputBorder(),
            ),
            //validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Rango salarial',
              border: OutlineInputBorder(),
            ),
            //validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Requerimientos',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton.icon(
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Guardar')),
        ),
      ],
    );
  }
}