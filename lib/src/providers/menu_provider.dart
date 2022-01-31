import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProviders {
  List<dynamic> opciones = [];

  _MenuProviders() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProviders = _MenuProviders();
