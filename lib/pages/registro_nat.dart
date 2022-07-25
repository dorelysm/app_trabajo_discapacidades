import 'package:flutter/material.dart';

class RegistroNatPage extends StatefulWidget {
  const RegistroNatPage({Key? key}) : super(key: key);

  @override
  State<RegistroNatPage> createState() => _RegistroNatPageState();
}

class _RegistroNatPageState extends State<RegistroNatPage> {

  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController nombreTextController = TextEditingController();
  TextEditingController apellidoTextController = TextEditingController();
  TextEditingController numIdTextController = TextEditingController();
  TextEditingController ciudadTextController = TextEditingController();
  TextEditingController celularTextController = TextEditingController();
  TextEditingController correoTextController = TextEditingController();
  TextEditingController contrasenaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de persona natural'),
        backgroundColor: const Color(0xff0096C7),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: keyForm,
            child: formularioRegistro(),
          ),
        ),
      ),
    );
  }
  
  //Diseño de los elementos del formulario
  formItemsDesign(icon, item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(
        leading: Icon(icon), 
        title: item)),
    );
  }

  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed("/");
  }
  
  String tipoId = 'cc';

  Widget formularioRegistro() {
    return Column(
      children: <Widget>[
        formItemsDesign(
          null,
          TextFormField(
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
            //validator: validateName,
          )
        ),

        formItemsDesign(
          null,
          TextFormField(
            controller: apellidoTextController,
            decoration: const InputDecoration(
              labelText: 'Apellido',
              border: OutlineInputBorder(),
            ),
            //validator: validateName,
          )
        ),

        formItemsDesign(
          null,
          Column(
            children: <Widget>[
              const Text('Tipo de identificación'),
              RadioListTile<String>(
                title: const Text('Cédula de ciudadanía'),
                value: 'cc',
                groupValue: tipoId,
                onChanged: (value) {
                  setState(() {
                    //tipoId = value;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text('Cédula de extranjería'),
                value: 'ce',
                groupValue: tipoId,
                onChanged: (value) {
                  setState(() {
                    //tipoId = value;
                  });
                },
              ),
            ],
          ),
        ),

        formItemsDesign(
          null,
          TextFormField(
            controller: numIdTextController,
            decoration: const InputDecoration(
              labelText: 'Número de identificación',
              border: OutlineInputBorder(),
            ),
            //validator: validateName,
          )
        ),

        //Fecha de nacimiento

        formItemsDesign(
          null,
          TextFormField(
            controller: ciudadTextController,
            decoration: const InputDecoration(
              labelText: 'Ciudad de residencia',
              border: OutlineInputBorder(),
            ),
            //validator: validateName,
          )
        ),

        //Género

        formItemsDesign(
          null,
          TextFormField(
            controller: celularTextController,
            decoration: const InputDecoration(
              labelText: 'Número de celular',
              border: OutlineInputBorder(),
            ),
            //validator: validateName,
          )
        ),

        formItemsDesign(
          null,
          TextFormField(
            controller: correoTextController,
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
              border: OutlineInputBorder(),
            ),
            //validator: validateName,
          )
        ),

        formItemsDesign(
          null,
          TextFormField(
            controller: contrasenaTextController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
            ),
            //validator: validateName,
          )
        ),
      ],
    );
  }

  
}
