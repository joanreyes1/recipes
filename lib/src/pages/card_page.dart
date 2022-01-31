import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          const SizedBox(height: 10.0),
          _cardTipo2(),
          const SizedBox(height: 10.0),
          _cardTipo1(),
          const SizedBox(height: 10.0),
          _cardTipo2(),
          const SizedBox(height: 10.0),
          _cardTipo1(),
          const SizedBox(height: 10.0),
          _cardTipo2(),
          const SizedBox(height: 10.0),
          _cardTipo1(),
          const SizedBox(height: 10.0),
          _cardTipo2(),
          const SizedBox(height: 10.0),
          _cardTipo1(),
          const SizedBox(height: 10.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Mark zuckerberg'),
            subtitle: Text(
                'Mark Elliot Zuckerberg es un programador y empresario estadounidense, uno de los creadores y fundadores de Meta, su actual presidente.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Cancelar')),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/130238819/original/d4096d4950eba421600f21c6c753c19375222eb6/draw-you-a-landscape-image-with-ms-paint.png'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),

          //const Image(
          //image: NetworkImage(
          //'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/130238819/original/d4096d4950eba421600f21c6c753c19375222eb6/draw-you-a-landscape-image-with-ms-paint.png')),
          // ignore: avoid_unnecessary_containers
          Container(
            child: const Text('Esta es una imagen clara'),
            padding: const EdgeInsets.all(10.0),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20.0,
            spreadRadius: 2.0,
            offset: Offset(1, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
