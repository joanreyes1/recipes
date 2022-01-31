import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 5.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://assets.turbologo.com/blog/es/2019/10/19133015/spiderman-logo-illustration.jpg"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: const Text("SP"),
              backgroundColor: Colors.orange.shade200,
            ),
          )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://images6.alphacoders.com/102/thumb-1920-1020775.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
