import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

double _currentSliderValue = 100;
bool _bloquearSlider = false;

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders Flutter'),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              _crearSlider(),
              _crearCheckBox(),
              Expanded(child: _crearImagen()),
            ],
          ),
        ));
  }

  Widget _crearSlider() {
    return Slider(
        value: _currentSliderValue,
        max: 400.0,
        min: 100.0,
        //divisions: 5,
        activeColor: Colors.amber,
        inactiveColor: Colors.amber.shade100,
        thumbColor: Colors.black,
        label: 'Tamaño de la imagen',
        onChanged: (_bloquearSlider)
            ? null
            : (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              });
  }

  Widget _crearCheckBox() {
    /*return Checkbox(
        value: _bloquearSlider,
        onChanged: (bool? valor) {
          setState(() {
            _bloquearSlider = valor!;
          });
        });*/

    /*return CheckboxListTile(
        title: const Text('Bloquear Slider'),
        value: _bloquearSlider,
        onChanged: (bool? valor) {
          setState(() {
            _bloquearSlider = valor!;
          });
        });*/

    /*return Switch(
        value: _bloquearSlider,
        onChanged: (bool? valor) {
          setState(() {
            _bloquearSlider = valor!;
          });
        });*/

    return SwitchListTile(
        title: const Text('Bloquear slider'),
        tileColor: Colors.blue.shade100,
        value: _bloquearSlider,
        onChanged: (bool? valor) {
          setState(() {
            _bloquearSlider = valor!;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image: const NetworkImage('assets/batman.png'),
      width: _currentSliderValue,
      fit: BoxFit.contain,
    );
  }
}
