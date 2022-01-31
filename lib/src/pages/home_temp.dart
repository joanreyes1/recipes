import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key? key}) : super(key: key);

  static final numeros = [
    'Gabriel Bailon',
    'Netfree etico',
    '100 HERMANOS CASTROS',
    'mami Magaly',
    'Gema'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Temp'),
      ),
      body: ListView(children: _agregarNumeroCorto()),
    );
  }

  //Método seperado para agregar una lista//
  List<Widget> _agregarNumero() {
    List<Widget> lista = [];

    for (var num in numeros) {
      final tempWidget = ListTile(
        title: Text(num),
      );

      lista.add(tempWidget);
      lista.add(const Divider());
    }

    return lista;
  }

  List<Widget> _agregarNumeroCorto() {
    return numeros
        .map((e) => Column(children: [
              ListTile(
                title: Text(e + '!'),
                subtitle: const Text("Escribiendo....."),
                leading: const Icon(Icons.contact_phone_rounded),
                trailing: const Icon(Icons.data_saver_on_rounded),
                onTap: () {},
              )
            ]))
        .toList();
  }
}
