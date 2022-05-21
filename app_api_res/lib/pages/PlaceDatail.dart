//TODO: Del sistema
import 'dart:html';

import 'package:flutter/material.dart';
//TODO: Desarrollo propio
import 'package:app_api_res/shared/response.dart';
import 'package:app_api_res/models/Places.dart';
//TODO: Parte externa => Internet
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDatailPage extends StatelessWidget {
  final Places? places;

  PlaceDatailPage({this.places});

  GoogleMapController? mapController;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    double sizeFont = 0;

    if (isTablet(context) || isDesktop(context)) {
      sizeFont = 20;
    } else if (isMobile(context)) {
      sizeFont = 14;
    }

    var marker = Marker(
        markerId: MarkerId(places!.id.toString()),
        position: LatLng(
            double.parse(places!.longitud!), double.parse(places!.longitud!)),
        infoWindow: InfoWindow(
          title: places!.nombre!,
          snippet: places!.descripcion!,
        ),
        onTap: () {
          print(places!.nombre!);
        });

    return Scaffold(
        body: Stack(
      children: [
        ListView(
          physics: (isPortrait == true)
              ? NeverScrollableScrollPhysics()
              : AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            (isPortrait == true)
                ? Image.network(
                    places!.imagenNombre!,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    places!.imagenNombre!,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Padding(padding: EdgeInsets.all(5.0), 
                    child: Row(
                      children: [
                        Text(places!.nombre!)
                      ],
                    ),
                  )
          ],
        )
      ],
    ));
  }

  Widget botonFuncion({
    Color? color, IconData? icon, String? text, int? evento, double sizeFont = 12
  }){
    return InkWell(
      child: Column(
        children: [
          Icon(icon, color:color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(text!)
          )
        ]
      ),

      onTap: () {
        switch (evento) {
          case 1:
              _marcar(places!.telefono!);
            break;
          case 2: 
_marcar(places!.url!);
          break;
          default:
        }
      }
    ),
  };


Widget _marcar(String telefono) async {
  String url = 'tel:$telefono';
  if (await canLaunch(url)) {
    await launch(url);
  }
  
}
}

