import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:http/http.dart' as http;

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
  static final url = 'https://w5vxmb3jjf.execute-api.us-east-2.amazonaws.com/dev/users';

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

  //Petición http
  Future createPost(String url, {required Map body}) async {
    //url = 'https://w5vxmb3jjf.execute-api.us-east-2.amazonaws.com/dev/users';
    String stringJson = json.encode(body);
  return http.post(Uri.parse(url), body: stringJson).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      throw Exception("Error while fetching data");
    }
    return Empresa.fromJson(json.decode(response.body));
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF8FB),
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
    } else if (value.length < 9 || value.length > 10) {
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
    } else if (value.length < 5){
      return "La contraseña debe contener por lo menos 5 caracteres";
    }
    else {
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
              onPressed: () async {
                if (keyForm.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  
                  Empresa newEmpresa = Empresa(name: nombreTextController.text, email: emailTextController.text, cellphone: celularTextController.text, password: contrasenaTextController.text);
                  print(newEmpresa.toMap());
                  Empresa p = await createPost(url,
                        body: newEmpresa.toMap());
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Guardar')),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    //futureAlbum = registrarEmpresa();
  }
}



class Empresa {
  final String name;
  final String email;
  final String cellphone;
  final String type;
  final String password;

  const Empresa({
    required this.name,
    required this.email,
    required this.cellphone,
    this.type='empresa',
    required this.password,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      name: json['name'],
      email: json['email'],
      cellphone: json['cellphone'],
      type: json['type'],
      password: json['password'],
    );
  }
  Map toMap() {
    var map = {};
    var data = {};
    var extraData = {};
    var enterprises = {};
    enterprises["cellphone"] = cellphone; 
    extraData["enterprises"] = enterprises;
    data["type"] = type;
    data["name"] = name;
    data["email"] = email;
    data["password"] = password; 
    data["extra_data"] = extraData;
    map["data"] = map;
    
    return map;
  }

}
