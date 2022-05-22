import 'dart:async';
import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeoService {
  List<Geo> Aux = [];

  Future<List<Geo>> obtenerGeoPosicion() async {
    print("Si entra al método");
    var url = Uri.parse("http://ipwho.is/8.8.4.4");
    var response = await http.get(url);

    List<Geo> DatosGenerales = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final GeoData = jsonDecode(body);
      print("a lo mejor funciona");
      print(GeoData);

      print(GeoData["ip"]);
      print(GeoData["success"]);
      print(GeoData["type"]);
      print(GeoData["continent"]);
      print(GeoData["continentCode"]);
      print(GeoData["country"]);
      print(GeoData["countryCode"]);
      print(GeoData["region"]);
      print(GeoData["regionCode"]);
      print(GeoData["city"]);
      print(GeoData["latitude"]);
      print(GeoData["longitude"]);
      print(GeoData["isEu,"]);
      print(GeoData["postal"]);
      print(GeoData["callingCode"]);
      print(GeoData["capital"]);
      print(GeoData["borders"]);
      print(GeoData["flag"]);
      print(GeoData["connection"]);
      print(GeoData["timezone"]);

      GeoData["ip"];
      GeoData["success"];
      GeoData["type"];
      GeoData["continent"];
      GeoData["continentCode"];
      GeoData["country"];
      GeoData["countryCode"];
      GeoData["region"];
      GeoData["regionCode"];
      GeoData["city"];
      GeoData["latitude"];
      GeoData["longitude"];
      GeoData["isEu,"];
      GeoData["postal"];
      GeoData["callingCode"];
      GeoData["capital"];
      GeoData["borders"];
      GeoData["flag"];
      GeoData["connection"];
      GeoData["timezone"];

      for (var i in GeoData) {
        DatosGenerales.add(Geo(
          i["ip"],
          i["success"],
          i["type"],
          i["continent"],
          i["continentCode"],
          i["country"],
          i["countryCode"],
          i["region"],
          i["regionCode"],
          i["city"],
          i["latitude"],
          i["longitude"],
          i["isEu,"],
          i["postal"],
          i["callingCode"],
          i["capital"],
          i["borders"],
          i["flag"],
          i["connection"],
          i["timezone"],
        ));
      }
      print("Datos gen que trae ");
      print(DatosGenerales);

      return GeoData;
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
