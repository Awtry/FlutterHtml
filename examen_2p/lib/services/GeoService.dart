import 'dart:async';
import 'dart:html';
import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeoService {
  var Apuntar = "";

  Future<Geo> obtenerGeoPosicion() async {
    print("Si entra al método");
    
    final String _url = 'ipwho.is';
    final url = Uri.http(_url, Apuntar);
    var response = await http.get(url);
 

    List<Geo> DatosGenerales = [];

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      print(parsed);
      if (parsed == null) {
        print("No hay nada de nada");
      }else{
        return Geo.fromJson(json.decode((response.body)));
      }
      throw Exception('Ni modo');
    } else {
      throw Exception('Ni modo');
    }
  }

  String Nombre(String Nom){
  Apuntar = '/' + Nom;

  return Apuntar;
}

}



