import 'package:flutter/material.dart';

class nuevoReclutadorPage extends StatefulWidget {
  const nuevoReclutadorPage({Key? key}) : super(key: key);

  @override
  State<nuevoReclutadorPage> createState() => _nuevoReclutadorPageState();
}

class _nuevoReclutadorPageState extends State<nuevoReclutadorPage> {

  GlobalKey<FormState> keyForm = GlobalKey();

  TextEditingController nombreTextController = TextEditingController();
  TextEditingController apellidoTextController = TextEditingController();
  TextEditingController idTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController celularTextController = TextEditingController();
  TextEditingController contrasenaTextController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Nuevo reclutador'),
          backgroundColor: const Color(0xff0096C7),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: keyForm,
            child: formularioNuevoReclutador(),
          ),
        ),
      ) 
    );
  }
  
  Widget formularioNuevoReclutador() {
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
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: apellidoTextController,
            decoration: const InputDecoration(
              labelText: 'Apellido',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            controller: idTextController,
            decoration: const InputDecoration(
              labelText: 'Número de identificación',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaNum,
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
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: celularTextController,
            decoration: const InputDecoration(
              labelText: 'Celular',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaNum,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: contrasenaTextController,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
            validator: validarContrasena,
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