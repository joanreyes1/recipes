import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

ScrollController _scrollController = ScrollController();

List<int> _listNumeros = [];
int _incrementarLista = 0;
bool _isLoading = false;

class _ListaPageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista y Scroll'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listNumeros[index];
            return FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/seed/$imagen/600/400'),
            );
          }),
    );
  }

  void _agregar10() {
    for (int i = 0; i <= 10; i++) {
      _incrementarLista++;
      _listNumeros.add(_incrementarLista);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    var duration = const Duration(seconds: 2);
    return Timer(duration, respuestaHTTP);
  }

  Future obtenerPagina1() async {
    var duration = const Duration(seconds: 2);
    Timer(duration, () {
      _listNumeros.clear();
      _incrementarLista++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void respuestaHTTP() {
    _isLoading = true;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
