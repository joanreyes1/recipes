import 'package:flutter/material.dart';
import 'package:recipes/src/pages/alert_page.dart';
import 'package:recipes/src/providers/menu_provider.dart';
import 'package:recipes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Componentes"),
        ),
        body: _lista());
  }

  Widget _lista() {
    /*menuProviders.cargarData().then((opciones) {
      print('_lista');
      print(opciones);
    });*/

    return FutureBuilder(
      future: menuProviders.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );

    /*return ListView(
      children: _listaItems(),
    );*/
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (var opt in data) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
        onTap: () {
          //final route =
          //MaterialPageRoute(builder: (context) => const AlertPage());
          //Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones.add(widgetTemp);
      opciones.add(const Divider());
    }
    return opciones;
  }
}
