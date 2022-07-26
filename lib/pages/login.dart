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
          )
          ),
        formItemsDesign(
          Icons.password,
          TextFormField(
            controller: usuarioTextController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
          )
          ),

        const ElevatedButton(onPressed: null, child: Text("Iniciar sesión")),

        const ElevatedButton(onPressed: null, child: Text("Inicia sesión con Google")),

        const ElevatedButton(onPressed: null, child: Text("Inicia sesión con Meta")),

        
      ],
    );
  }


}
