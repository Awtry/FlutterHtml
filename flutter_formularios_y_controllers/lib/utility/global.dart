import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Global {
  static const Color colorBlanco = Color.fromARGB(255, 231, 228, 228);
  static const Color colorAzul = Color.fromARGB(255, 64, 196, 199);
  static const Color colorNegro = Color.fromARGB(255, 19, 54, 46);
  static const Color colorEmpresa = Color.fromARGB(255, 100, 15, 50);

 static void mensaje(BuildContext context, String mensaje, String titulo, {Color backgroundColorCustom = Colors.yellowAccent}) {
    Flushbar(
      title: titulo,
      message: mensaje,
      duration: const Duration(seconds: 3),
      isDismissible: false,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: backgroundColorCustom,
    ).show(context);
  }
}
