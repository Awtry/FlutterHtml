import 'package:flutter/material.dart';

class PrimerPage extends StatelessWidget{

  const PrimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hey"),
      ),
      body: const Center(
        child: Text("Hey 2")
      )
    );
  }

}