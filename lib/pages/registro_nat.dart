import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';


class RegistroNatPage extends StatefulWidget {
  const RegistroNatPage({Key? key}) : super(key: key);

  @override
  State<RegistroNatPage> createState() => _RegistroNatPageState();
}

class _RegistroNatPageState extends State<RegistroNatPage> {
  GlobalKey<FormState> keyForm = GlobalKey(); //Llave del formulario

  //Controladores
  TextEditingController nombreTextController = TextEditingController();
  TextEditingController apellidoTextController = TextEditingController();
  TextEditingController numIdTextController = TextEditingController();
  TextEditingController profesionTextController = TextEditingController();
  TextEditingController celularTextController = TextEditingController();
  TextEditingController correoTextController = TextEditingController();
  TextEditingController contrasenaTextController = TextEditingController();
  TextEditingController confirmarContrasenaTextController = TextEditingController();

// Valores de las listas desplegables
  final List<Map<String, dynamic>> _tiposId = [
    {'value': 'cc',
    'label': 'Cédula de ciudadanía'},
    {'value': 'ce',
    'label': 'Cédula de extranjería'},
    {'value': 'pasaporte',
    'label': 'Pasaporte'}
  ];
  final List<Map<String, dynamic>> _generos = [
    {'value': 'hombre',
    'label': 'Hombre'},
    {'value': 'mujer',
    'label': 'Mujer'},
    {'value': 'otro',
    'label': 'Otro'},
    ];
  final List<Map<String, dynamic>> _discapacidades = [
    {'value': 'fisica',
    'label': 'Física'},
    {'value': 'sensorial',
    'label': 'Sensorial'},
    {'value': 'visual',
    'label': 'Visual'},
    {'value': 'auditiva',
    'label': 'Auditiva'},
    {'value': 'intelectual',
    'label': 'Intelectual'},
    {'value': 'psicosocial',
    'label': 'Psicosocial'},
    {'value': 'visceral',
    'label': 'Visceral'},
    {'value': 'multiple',
    'label': 'Múltiple'},
    ];
  final List<Map<String, dynamic>> _paises = [];
  final List<Map<String, dynamic>> _ciudades = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis datos personales'),
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
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  //Métodos de navegación
  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed("/");
  }

  //Validaciones

  String? validarEntradaTexto(value){
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

  String? validarEntradaNum(value){
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

  String? validarCorreo(value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
    } else if(value != contrasenaTextController.text) {
      return "Las contraseñas no coinciden";
    } else {
      return null;
    }
  }

  Widget formularioRegistro() {
    return Column(
      children: <Widget>[
        /*
        const Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg')),
        */

        formItemsDesign(
          null,
          TextFormField(
            controller: nombreTextController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          )),

        formItemsDesign(
          null,
          TextFormField(
            controller: apellidoTextController,
            decoration: const InputDecoration(
              labelText: 'Apellido',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaTexto,
          )),

        formItemsDesign(
          null,
          SelectFormField(
            type: SelectFormFieldType.dropdown,
            initialValue: 'cc',
            labelText: 'Tipo de identificación',
            items: _tiposId,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          )
        ),

        formItemsDesign(
          null,
          TextFormField(
            controller: numIdTextController,
            decoration: const InputDecoration(
              labelText: 'Número de identificación',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaNum,
          )),

        formItemsDesign(
          null,
          TextFormField(
            controller: correoTextController,
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
              border: OutlineInputBorder(),
            ),
            validator: validarCorreo,
          )),

        formItemsDesign(
          null,
          TextFormField(
            controller: celularTextController,
            decoration: const InputDecoration(
              labelText: 'Número de celular',
              border: OutlineInputBorder(),
            ),
            validator: validarEntradaNum,
          )),

        //fecha de nacimiento

        formItemsDesign(
          null,
          SelectFormField(
            type: SelectFormFieldType.dropdown,
            //initialValue: 'hombre',
            labelText: 'Pais',
            items: _paises,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          )
        ),

        formItemsDesign(
          null,
          SelectFormField(
            type: SelectFormFieldType.dropdown,
            //initialValue: 'hombre',
            labelText: 'Ciudad',
            items: _ciudades,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          )
        ),

        formItemsDesign(
          null,
          SelectFormField(
            type: SelectFormFieldType.dropdown,
            initialValue: 'hombre',
            labelText: 'Género',
            items: _generos,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
          )
        ),

        //Ciudad

        formItemsDesign(
            null,
            TextFormField(
              controller: profesionTextController,
              decoration: const InputDecoration(
                labelText: 'Profesión',
                border: OutlineInputBorder(),
              ),
              validator: validarEntradaTexto,
            )),

        //Tipo de discapacidad
        formItemsDesign(
          null,
          SelectFormField(
            type: SelectFormFieldType.dropdown,
            initialValue: 'fisica',
            labelText: 'Física',
            items: _discapacidades,
            onChanged: (val) => print(val),
            onSaved: (val) => print(val),
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
            validator: validarContrasena,
          )),

        formItemsDesign(
          null,
          TextFormField(
            controller: confirmarContrasenaTextController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirmar contraseña',
              border: OutlineInputBorder(),
            ),
            validator: validarConfirmarContrasena,
          )),


        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton(onPressed: () {
            if (keyForm.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          }, child: const Text('Guardar')),
        )
      ],
    );
  }
}


