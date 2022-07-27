import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController usuarioTextController = TextEditingController();
  TextEditingController contrasenaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }


  String? validarUsuario(value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Ingrese el usuario";
    } else if (!regExp.hasMatch(value)) {
      return "Ingrese un usuario válido";
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
  
  
  Widget formularioLogin() {
    return Column(
      children: <Widget>[
        const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rosario',
                fontWeight: FontWeight.bold,
                fontSize: 50),
        ),

        formItemsDesign(
          Icons.login,
          TextFormField(
            controller: usuarioTextController,
            decoration: const InputDecoration(
              labelText: 'Usuario',
              border: OutlineInputBorder(),
            ),
            validator: validarUsuario,
            
          )
          ),
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
          )
          ),

        ElevatedButton(onPressed: () {
          if (keyForm.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
        }, child: const Text("Iniciar sesión")),

        const ElevatedButton(onPressed: null, child: Text("Inicia sesión con Google")),

        const ElevatedButton(onPressed: null, child: Text("Inicia sesión con Meta")),

        
      ],
    );
  }


}
