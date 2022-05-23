import 'dart:async';
import 'dart:html';
import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeoService {
  List<Geo> Aux = [];

  Future<Geo> obtenerGeoPosicion() async {
    print("Si entra al método");
    var url = Uri.parse("http://ipwho.is/8.8.4.4");
    var response = await http.get(url);

    List<Geo> DatosGenerales = [];

    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      print(parsed);
      return Geo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ni pedo');
    }
  }

  /*
  List<Geo> parseGeo(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Geo>((json) => Geo.fromJson(json)).toList();
  }

  Future<List<Geo>> fetchGeo() async {
    var url = Uri.parse("http://ipwho.is/8.8.4.4");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseGeo(response.body);
    } else {
      throw Exception('Ni pedo');
    }
  }
*/
/*
  Future<List<dynamic>> obtenerGeoPosicion() async {
    print("Si entra al método");
    var url = Uri.parse("http://ipwho.is/8.8.4.4");
    var response = await http.get(url);
    final parsed = json.decode(response.body) as Map;
    print("La cosa parse");
    print(parsed);

    List<Geo> DatosGenerales =
        parsed[""].map<Geo>((json) => Geo.fromJson(json)).toList();

    print("Los datos generales");
    print(DatosGenerales[0]);

    return DatosGenerales;
  }*/
}
