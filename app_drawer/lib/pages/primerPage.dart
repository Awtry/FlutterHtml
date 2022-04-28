import 'package:flutter/material.dart';

class primerPage extends StatelessWidget{
  const primerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context ){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Primera página"),
      ),
      body: const Center(
        child: Text('Bienvenido a la segunda página')
      ),
    );
  }
}