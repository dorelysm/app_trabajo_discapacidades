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
  TextEditingController contrasenaTextController = TextEditingController();
  TextEditingController confirmarContrasenaTextController =
      TextEditingController();

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
      backgroundColor: Color(0xffEEF8FB),
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

  //Validaciones

  String? validarEntradaTexto(value) {
    String pattern = r'^[a-zA-Z ]*$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Campo obligatorio";
    } else if (!regExp.hasMatch(value)) {
      return "Debe contener solo letras";
    } else {
      return null;
    }
  }

  String? validarEntradaNum(value) {
    String pattern = r'^[0-9]*$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Campo obligatorio";
    } else if (!regExp.hasMatch(value)) {
      return "Debe contener solo números";
    } else {
      return null;
    }
  }

  String? validarNit(value) {
    String pattern = r'^[0-9]*$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Campo obligatorio";
    } else if (!regExp.hasMatch(value)) {
      return "Debe contener solo números";
    } else if (value.length < 6) {
      return "Ingrese un Nit válido";
    } else {
      return null;
    }
  }

  String? validarCorreo(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Ingrese el correo";
    } else if (!regExp.hasMatch(value)) {
      return "Ingrese un correo válido";
    } else {
      return null;
    }
  }

  String? validarContrasena(value) {
    if (value == null || value.isEmpty) {
      return "Ingrese la contraseña";
    } else {
      return null;
    }
  }

  String? validarConfirmarContrasena(value) {
    if (value == null || value.isEmpty) {
      return "Ingrese la contraseña";
    } else if (value != contrasenaTextController.text) {
      return "Las contraseñas no coinciden";
    } else {
      return null;
    }
  }

  Widget formularioRegistroEmp() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: razonSocialTextController,
            decoration: const InputDecoration(
              labelText: 'Razón social',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: nitTextController,
            decoration: const InputDecoration(
              labelText: 'Nit',
              border: OutlineInputBorder(),
            ),
            validator: validarNit,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: emailTextController,
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
              border: OutlineInputBorder(),
            ),
            validator: validarCorreo,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: celularTextController,
            decoration: const InputDecoration(
              labelText: 'Número de teléfono',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaNum,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: SelectFormField(
            type: SelectFormFieldType.dropdown,
            initialValue: 'industrial',
            labelText: 'Sector',
            items: _sectores,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: SelectFormField(
            type: SelectFormFieldType.dropdown,
            initialValue: 'colombia',
            labelText: 'Pais',
            items: _paises,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: SelectFormField(
            type: SelectFormFieldType.dropdown,
            initialValue: 'barranquilla',
            labelText: 'Ciudad',
            items: _ciudades,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: descripcionTextController,
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
            controller: contrasenaTextController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
            validator: validarContrasena,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: confirmarContrasenaTextController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirmar contraseña',
              border: OutlineInputBorder(),
            ),
            validator: validarConfirmarContrasena,
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
