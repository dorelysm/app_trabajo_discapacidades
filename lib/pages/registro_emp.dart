import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class RegistroEmpPage extends StatefulWidget {
  const RegistroEmpPage({Key? key}) : super(key: key);

  @override
  State<RegistroEmpPage> createState() => _RegistroEmpPageState();
}

class _RegistroEmpPageState extends State<RegistroEmpPage> {

  GlobalKey<FormState> keyForm = GlobalKey();

    TextEditingController nombreTextController = TextEditingController();
    TextEditingController razonSocialTextController = TextEditingController();
    TextEditingController nitTextController = TextEditingController();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController celularTextController = TextEditingController();
    TextEditingController descripcionTextController = TextEditingController();

  // Valores de las listas desplegables
  final List<Map<String, dynamic>> _sectores = [
    {'value': 'industrial', 'label': 'Industrial'},
    {'value': 'salud', 'label': 'Salud'},
    {'value': 'alimentos', 'label': 'Alimentos'},
    {'value': 'construccion', 'label': 'Construcción'},
    {'value': 'tecnologia', 'label': 'Tecnología'},
  ];
  final List<Map<String, dynamic>> _paises = [
    {'value': 'colombia', 'label': 'Colombia'},
  ];
  final List<Map<String, dynamic>> _ciudades = [
    {'value': 'barranquilla', 'label': 'Barranquilla'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de mi empresa'),
        backgroundColor: const Color(0xff0096C7),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: keyForm,
            child: formularioRegistroEmp(),
          ),
        ),
      ),
    );
  }

  Widget formularioRegistroEmp() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: nombreTextController,
          decoration: const InputDecoration(
            labelText: 'Nombre',
            border: OutlineInputBorder(),
          ),
          //validator: validarEntradaTexto,
        ),
        TextFormField(
          controller: razonSocialTextController,
          decoration: const InputDecoration(
            labelText: 'Razón social',
            border: OutlineInputBorder(),
          ),
          //validator: validarEntradaTexto,
        ),
        TextFormField(
          controller: nitTextController,
          decoration: const InputDecoration(
            labelText: 'Nit',
            border: OutlineInputBorder(),
          ),
          //validator: validarEntradaTexto,
        ),
        TextFormField(
          controller: emailTextController,
          decoration: const InputDecoration(
            labelText: 'Correo electrónico',
            border: OutlineInputBorder(),
          ),
          //validator: validarEntradaTexto,
        ),
        TextFormField(
          controller: celularTextController,
          decoration: const InputDecoration(
            labelText: 'Número de teléfono',
            border: OutlineInputBorder(),
          ),
          //validator: validarEntradaTexto,
        ),
        SelectFormField(
          type: SelectFormFieldType.dropdown,
              initialValue: 'industrial',
              labelText: 'Industrial',
              items: _sectores,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
        ),
        SelectFormField(
          type: SelectFormFieldType.dropdown,
          initialValue: 'colombia',
          labelText: 'Pais',
          items: _paises,
          onChanged: (val) => print(val),
          onSaved: (val) => print(val),
        ),
        SelectFormField(
          type: SelectFormFieldType.dropdown,
          initialValue: 'barranquilla',
          labelText: 'Ciudad',
          items: _ciudades,
          onChanged: (val) => print(val),
          onSaved: (val) => print(val),
        ),
        TextFormField(
          controller: descripcionTextController,
          decoration: const InputDecoration(
            labelText: 'Descripción',
            border: OutlineInputBorder(),
          ),
          //validator: validarEntradaTexto,
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