import 'dart:async';
import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeoService {
  Future<List<Geo>> obtenerGeoPosicion() async {
    var url = Uri.parse("http://ipwho.is/8.8.4.4");
    var response = await http.get(url);
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Geo> DatosGenerales =
        parsed.map<Geo>((json) => Geo.fromJson(json)).toList();

    if (response.statusCode == 200) {
      return DatosGenerales;
    } else {
      throw Exception('Eso no es un 200 desde la API');
    }
  }
}
