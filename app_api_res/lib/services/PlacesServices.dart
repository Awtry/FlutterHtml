import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_api_res/models/Places.dart';

class PlacesServices{
  Future<List<Places>> obtenerLugares() async {
    var url = Uri(host: "https://appmtwdm2022.herokuapp.com/lugares");
    var response = await http.get(url);
    final parsed = jsonDecode(response.body).cast<Map<String,dynamic>>();
    
    List<Places> places = parsed.map<Places>((json) => Places.fromJson(json)).tolist();

    return places;

  }
}