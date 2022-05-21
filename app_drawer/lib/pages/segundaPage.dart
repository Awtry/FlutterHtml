import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class segundaPage extends StatelessWidget{
  const segundaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda página"),
      ),
      body: const Center(
        child: Text('Bienvenido a la segunda página')
      ),
    );
  }
}