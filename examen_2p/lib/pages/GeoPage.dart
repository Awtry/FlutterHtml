import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/services/GeoService.dart';
import 'package:http/retry.dart';

class GeoPage extends StatefulWidget {
  GeoPage({Key? key}) : super(key: key);

  @override
  State<GeoPage> createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  GeoService geoService = new GeoService();
  bool cargando = true;

  List<Widget> geo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miaaaaauuuuuuuuuuuuuuuuuuuuu'),
      ),
      body: Container(
        child: FutureBuilder<Geo>(
          future: geoService.obtenerGeoPosicion(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView(
                children: Localizar(snapshot.data),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              print(snapshot.data);
              print("según sin datos");
              return Text("Error garrafal");
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

/*
  List<Widget> generalidad(Geo data) {
    geo.add(Text(data.ip.toString()));
    geo.add(Text(data.success.toString()));
    geo.add(Text(data.type.toString()));
    geo.add(Text(data.continent.toString()));
    geo.add(Text(data.continentCode.toString()));
    geo.add(Text(data.region.toString()));
    geo.add(Text(data.regionCode.toString()));
    geo.add(Text(data.city.toString()));
    geo.add(Text(data.latitude.toString()));
    geo.add(Text(data.longitude.toString()));
    return geo;
  }
*/
  List<Widget> Localizar(Geo data) {
    geo.add(Text("La ip es: " + data.ip.toString()));
    geo.add(Text("Recolección de datos correcta: " + data.success.toString()));
    geo.add(Text("Tipo de conexión: " + data.type.toString()));
    geo.add(Text("Contiennte: " + data.continent.toString()));
    geo.add(Text("Código de continente: " + data.continentCode.toString()));
    geo.add(Text("País: " + data.country.toString()));
    geo.add(Text("Código de país: " + data.countryCode.toString()));
    geo.add(Text("Región: " + data.region.toString()));
    geo.add(Text("Código de región: " + data.regionCode.toString()));
    geo.add(Text("Ciudad: " + data.city.toString()));
    geo.add(Text("Latitud: " + data.latitude.toString()));
    geo.add(Text("Longitud: " + data.longitude.toString()));
    geo.add(Text("Código postal: " + data.postal.toString()));
    geo.add(Text("Lada: " + data.callingCode.toString()));
    geo.add(Text("Capital: " + data.capital.toString()));
    geo.add(Text("La bordes: " + data.borders.toString()));
    geo.add(Text("Bandera: " + data.flag.toString()));
    return geo;
  }
}
