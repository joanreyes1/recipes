import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

var _nombre = '';
var _email = '';
var _fecha = '';
var _drondownvalue = 'Seleccionar una opción';
List<String> _poderes = ["super golpe",'super salto','super rayo','volar','correr'];

//List<String> _poderes = ['volar','rayos laser','super poder','super fuerza'];

TextEditingController _inputFieldDataController = TextEditingController();

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input page"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.accessibility_sharp),
          icon: const Icon(Icons.account_box_rounded),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: "Nombre:",
          hintText: "Ingrese su nombre",
          counterText: 'Letras: ${_nombre.length}',
          helperText: "Solo ingrese nombres"),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.email_outlined),
        icon: const Icon(Icons.email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: "Email:",
        hintText: "Ingrese su email",
        //counterText: 'Letras: ${_nombre.length}',
        //helperText: "Solo ingrese nombres"
      ),
      onChanged: (valor) {
        setState(() => _email = valor);
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.lock),
        icon: const Icon(Icons.password),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: "Contraseña:",
        hintText: "Ingrese su contraseña",
        //counterText: 'Letras: ${_nombre.length}',
        //helperText: "Solo ingrese nombres"
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.lock),
        icon: const Icon(Icons.password),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: "Fecha de nacimiento:",
        hintText: "Fecha de nacimiento",
        //counterText: 'Letras: ${_nombre.length}',
        //helperText: "Solo ingrese nombres"
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2025)
        locale: const Locale('es','ES')
        
        );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDataController.text = _fecha;
        
      });
    }
  }

  //List<DropdownMenuItem<String>> getOpcionesDropdown{
    //List<DropdownMenuItem<String>> lista = ;
  //}
  
  Widget _crearDropdown(){
    return DropdownButton<String>(
      items: _poderes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(_drondownvalue),
      onChanged: (String? newValue) {
        setState(() {
          _drondownvalue = newValue!;
        });
      },
    );
  }
  
  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es: $_nombre"),
      subtitle: Text("Email: $_email"),
    );
  }
}
