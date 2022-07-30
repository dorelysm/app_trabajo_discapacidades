import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

String url = 'https://w5vxmb3jjf.execute-api.us-east-2.amazonaws.com/dev/users?email=';
String comillas ='"';
Future<dynamic> _getUsuario(email) async {
  final respuesta =await http.get(Uri.parse('$url$comillas$email$comillas')); //Petición http a la api

  if (respuesta.statusCode == 200){
    print(jsonDecode(respuesta.body)); //Muestra información del usuario
    return jsonDecode(respuesta.body); //Devuelve la información del usuario
  } else {
    print("Error con la respuesta");
  }

}
/*
Future<http.Response> getUsuarios() async {
  final response = await http.get(Uri.parse(
      'https://w5vxmb3jjf.execute-api.us-east-2.amazonaws.com/dev/users/13'));
  if (response.statusCode == 200) {
    print(response.body);
    // example@google.com
    var userEmail = json.decode(response.body)['data']['email'];
    var userPass = json.decode(response.body)['data']['password'];
    print(userEmail);
    print(userPass);
    return response;
  } else {
    throw Exception('Failed to load user');
  }
}
*/
class Usuarios {
  final int id;
  final String name;
  final String token;

  const Usuarios({
    required this.id,
    required this.name,
    required this.token,
  });

  factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
      id: json['id'],
      name: json['name'],
      token: json['token'],
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController usuarioTextController = TextEditingController();
  TextEditingController contrasenaTextController = TextEditingController();
  late Future<http.Response> futureUsuario;

  @override
  void initState() {
    super.initState();
    //futureUsuario = getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF8FB),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xff0096C7),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: keyForm,
            child: formularioLogin(),
          ),
        ),
      ),
    );
  }

  //Diseño de los elementos del formulario
  formItemsDesign(icon, item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  // Validaciones
  String? validarUsuario(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    //print(getUsuarios());
    // var username = json.decode(getUsuarios())['data']['email'];
    if (value == null || value.isEmpty) {
      return "Ingrese el usuario";
    } else if (!regExp.hasMatch(value)) {
      return "Ingrese un usuario válido";
    } 
    // else if (value == username) {
    //   return "Ingrese un usuario válido";
    // }
    else {
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

  Widget formularioLogin() {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rosario',
                fontWeight: FontWeight.bold,
                fontSize: 50),
          ),
        ),
        formItemsDesign(
            Icons.people,
            TextFormField(
              controller: usuarioTextController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
              validator: validarUsuario,
            )),
        formItemsDesign(
            Icons.password,
            TextFormField(
              controller: contrasenaTextController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              validator: validarContrasena,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton(
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  // print(getUsuarios(usuarioTextController.text));
                  //print(getUsuarios());
                  _getUsuario(usuarioTextController.text); //Llama al metodo para traer la informacion del usuario
                }
              },
              child: const Text("Iniciar sesión")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton(
              onPressed: () {
                _showLogin(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  side: MaterialStateProperty.all(const BorderSide(
                    color: Color(0xff022C64),
                    width: 2,
                  ))),
              child: const Text("Inicia sesión con Google")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton(
              onPressed: () {
                _showLogin(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  side: MaterialStateProperty.all(const BorderSide(
                    color: Color(0xff0096C7),
                    width: 2,
                  ))),
              child: const Text("Inicia sesión con Meta")),
        ),
        TextButton(
            onPressed: () {
              _showRegistro(context);
            },
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Rosario',
                ))),
            child: const Text("¿Desea registrarse?"))
      ],
    );
  }

  //Métodos de navegador
  void _showRegistro(BuildContext context) {
    Navigator.of(context).pushNamed("/registro");
  }

  void _showLogin(BuildContext context) {
    Navigator.of(context).pushNamed("/login");
  }
}
