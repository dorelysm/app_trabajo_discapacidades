import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class RegistroNatPage extends StatefulWidget {
  const RegistroNatPage({Key? key}) : super(key: key);
  @override
  State<RegistroNatPage> createState() => _RegistroNatPageState();
}

class _RegistroNatPageState extends State<RegistroNatPage> {
  //Llave del formulario
  GlobalKey<FormState> keyForm = GlobalKey();
  //Controladores
  TextEditingController nombreTextController = TextEditingController();
  TextEditingController apellidoTextController = TextEditingController();
  TextEditingController numIdTextController = TextEditingController();
  TextEditingController profesionTextController = TextEditingController();
  TextEditingController celularTextController = TextEditingController();
  TextEditingController correoTextController = TextEditingController();
  TextEditingController contrasenaTextController = TextEditingController();
  TextEditingController confirmarContrasenaTextController =
      TextEditingController();

// Valores de las listas desplegables
  final List<Map<String, dynamic>> _tiposId = [
    {'value': 'cc', 'label': 'Cédula de ciudadanía'},
    {'value': 'ce', 'label': 'Cédula de extranjería'},
    {'value': 'pasaporte', 'label': 'Pasaporte'}
  ];
  final List<Map<String, dynamic>> _generos = [
    {'value': 'hombre', 'label': 'Hombre'},
    {'value': 'mujer', 'label': 'Mujer'},
    {'value': 'otro', 'label': 'Otro'},
  ];
  final List<Map<String, dynamic>> _discapacidades = [
    {'value': 'fisica', 'label': 'Física'},
    {'value': 'sensorial', 'label': 'Sensorial'},
    {'value': 'visual', 'label': 'Visual'},
    {'value': 'auditiva', 'label': 'Auditiva'},
    {'value': 'intelectual', 'label': 'Intelectual'},
    {'value': 'psicosocial', 'label': 'Psicosocial'},
    {'value': 'visceral', 'label': 'Visceral'},
    {'value': 'multiple', 'label': 'Múltiple'},
  ];
  final List<Map<String, dynamic>> _paises = [
    {'value': 'colombia', 'label': 'Colombia'},
  ];
  final List<Map<String, dynamic>> _ciudades = [
    {'value': 'barranquilla', 'label': 'Barranquilla'},
  ];

  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Color Scaffold
      backgroundColor: Color(0xffEEF8FB),
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
      child: Card(
        child: ListTile(leading: Icon(icon), title: item),
        elevation: 0,
        color: const Color(0xffEEF8FB),
      ),
    );
  }

  //Métodos de navegación
  void _showHome(BuildContext context) {
    Navigator.of(context).pushNamed("/");
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

  Widget formularioRegistro() {
    return Column(
      children: <Widget>[
        /*
        const Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/02/11/16/59/dog-1194083_1280.jpg')),
        */

        //Nombre
        formItemsDesign(
            Icons.people,
            TextFormField(
              controller: nombreTextController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
              validator: validarEntradaTexto,
            )),

        //Apellido
        formItemsDesign(
            Icons.people,
            TextFormField(
              controller: apellidoTextController,
              decoration: const InputDecoration(
                labelText: 'Apellido',
                border: OutlineInputBorder(),
              ),
              validator: validarEntradaTexto,
            )),

        //Tipo de identificación
        formItemsDesign(
            Icons.badge,
            SelectFormField(
              type: SelectFormFieldType.dropdown,
              initialValue: 'cc',
              labelText: 'Tipo de identificación',
              items: _tiposId,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            )),

        //ID
        formItemsDesign(
            Icons.numbers,
            TextFormField(
              controller: numIdTextController,
              decoration: const InputDecoration(
                labelText: 'Número de identificación',
                border: OutlineInputBorder(),
              ),
              validator: validarEntradaNum,
            )),

        //Correo electronico
        formItemsDesign(
            Icons.mail,
            TextFormField(
              controller: correoTextController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
              validator: validarCorreo,
            )),

        // # de celular
        formItemsDesign(
            Icons.call,
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
          Icons.calendar_month,
          TextFormField(
              readOnly: true,
              controller: dateController,
              decoration: InputDecoration(hintText: 'Fecha de nacimiento'),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                dateController.text = date.toString().substring(0, 10);
              }),
        ),

        //País
        formItemsDesign(
            Icons.add_location_sharp,
            SelectFormField(
              type: SelectFormFieldType.dropdown,
              initialValue: 'colombia',
              labelText: 'Pais',
              items: _paises,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            )),

        //City
        formItemsDesign(
            Icons.location_city,
            SelectFormField(
              type: SelectFormFieldType.dropdown,
              initialValue: 'barranquilla',
              labelText: 'Ciudad',
              items: _ciudades,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            )),

        //Genero
        formItemsDesign(
            Icons.supervised_user_circle_sharp,
            SelectFormField(
              type: SelectFormFieldType.dropdown,
              initialValue: 'hombre',
              labelText: 'Género',
              items: _generos,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            )),

        //Profesion
        formItemsDesign(
            Icons.badge,
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
            Icons.settings_accessibility_outlined,
            SelectFormField(
              type: SelectFormFieldType.dropdown,
              initialValue: 'fisica',
              labelText: 'Tipo de discapacidad',
              items: _discapacidades,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            )),

        //Constraseña
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

        //Validar contraseña
        formItemsDesign(
            Icons.password,
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
        )
      ],
    );
  }

  void _showRegistroNat(BuildContext context) {
    Navigator.of(context).pushNamed("/registro_nat");
  }

  var jsonMap = {
    "name": "nombreTextController",
    "cellphone": "celularTextController",
    "type": "naturalUser",
    "photo": "null",
    "state": "1",
    "email": "correoTextController",
    "password": "contrasenaTextController",
    "Disabilities": "",
  };
  /* TextEditingController nombreTextController = TextEditingController();
  TextEditingController apellidoTextController = TextEditingController();
  TextEditingController numIdTextController = TextEditingController();
  TextEditingController profesionTextController = TextEditingController();
  TextEditingController celularTextController = TextEditingController();
  TextEditingController correoTextController = TextEditingController();
  TextEditingController contrasenaTextController = TextEditingController();
  TextEditingController confirmarContrasenaTextController =
      TextEditingController(); */
  void _showDatePicker() {
    context:
    context;
    initialDate:
    DateTime.now();
    firstDate:
    DateTime(1900);
    lastDate:
    DateTime(2100);
  }
}

/*@override
void dispose() {
  super.dispose();
}*/

final dateController = TextEditingController();
