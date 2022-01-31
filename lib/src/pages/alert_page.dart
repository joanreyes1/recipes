import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => _mostrarAlerta(context),
          child: const Text("Mostrar Alerta"),
          style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.blue,
              shape: const StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.exit_to_app),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: const Text("Título"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Este es el contenido del titulo"),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancelar"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue.shade200,
                    primary: Colors.white),
              ),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.shade200,
                      primary: Colors.white)),
            ],
          );
        });
  }
}
