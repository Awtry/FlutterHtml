import 'package:flutter/material.dart';
import 'package:flutter_formularios_y_controllers/utility/global.dart';
import 'package:flutter_formularios_y_controllers/widgets/button_widget.dart';
import 'package:flutter_formularios_y_controllers/widgets/textfield_widget.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final TextEditingController _controllerUSERNAME = TextEditingController();
  final TextEditingController _controllerUSERLAST = TextEditingController();
  final TextEditingController _controllerMAIL = TextEditingController();
  final TextEditingController _controllerPHONE = TextEditingController();

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
        body: Builder(
          builder: (context) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Primer caja de texto
                    //Ver si el controller cambia por caja
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFieldWidget(
                          isPrefixIcon: true,
                          prefixIconData: Icons.person,
                          isSuffixIcon: true,
                          sufixtIconData: Icons.lock,
                          isMyControllerActivate: true,
                          controller: _controllerUSERNAME,
                          onsuffixIconTap: () {
                            print('Click');
                          },
                          hintText: 'Ingresa tu nombre',
                          onChange: (String value) => {print(value)}),
                    ),
                    //Segunda caja de texto
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFieldWidget(
                          isPrefixIcon: true,
                          prefixIconData: Icons.person,
                          isSuffixIcon: true,
                          sufixtIconData: Icons.verified_user,
                          isMyControllerActivate: true,
                          controller: _controllerUSERLAST,
                          onsuffixIconTap: () {
                            print('Click');
                          },
                          hintText: 'Ingresa tu apellido',
                          onChange: (String value) => {print(value)}),
                    ),
                    //Tercera caja de texto
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFieldWidget(
                          isPrefixIcon: true,
                          prefixIconData: Icons.mail_outline,
                          isSuffixIcon: true,
                          sufixtIconData: Icons.pan_tool_alt,
                          isMyControllerActivate: true,
                          controller: _controllerMAIL,
                          onsuffixIconTap: () {
                            print('Click');
                          },
                          hintText: 'Ingresa tu correo',
                          onChange: (String value) => {print(value)}),
                    ),
                    //Cuarta caja de texto
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFieldWidget(
                          isPrefixIcon: true,
                          prefixIconData: Icons.phone,
                          isSuffixIcon: true,
                          sufixtIconData: Icons.pan_tool_alt,
                          isMyControllerActivate: true,
                          controller: _controllerPHONE,
                          onsuffixIconTap: () {
                            print('Click');
                          },
                          hintText: 'Ingresa tu teléfono',
                          onChange: (String value) => {print(value)}),
                    ),
                    FadeInDown(
                      child: ButtonWidget(
                        title: 'Button',
                        otherColor: false,
                        width: 200.0,
                        height: 40.0,
                        colorButton: Color.fromARGB(255, 22, 107, 48),
                        hasColor: false,
                        onPressed: () {
                          if (_controllerUSERNAME.text.isEmpty || _controllerUSERLAST.text.isNotEmpty || _controllerMAIL.text.isEmpty || _controllerPHONE.text.isNotEmpty) {
                            Global.mensaje(
                                context, 'Ingresa tu nombre completo', 'Valida');
                            return;
                          }
                          print('Button pressed ${_controllerUSERNAME.text}');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
