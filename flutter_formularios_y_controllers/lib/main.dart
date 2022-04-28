import 'package:flutter/material.dart';
import 'package:flutter_formularios_y_controllers/widgets/button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nya mon ami',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Miau'),
        ),
        body: Center(
          child: ButtonWidget(
            title: 'Button',
            otherColor: false,
            width: 200.0,
            height: 40.0,
            colorButton: Color.fromARGB(255, 22, 107, 48),
            hasColor: false,
            onPressed: (){
              print('Button pressed');
            },
          ),
        ),
      ),
    );
  }
}
