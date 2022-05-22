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
                children: generalidad(snapshot.data),
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

  Widget Localizar(Geo data) {
    return ListView(
      children: [
        Text("La ip es: " + data.ip.toString()),
        Text("Recolección de datos correcta: " + data.success.toString()),
        Text("Tipo de conexión: " + data.type.toString()),
        Text("Contiennte: " + data.continent.toString()),
        Text("Código de continente: " + data.continentCode.toString()),
        Text("País: " + data.country.toString()),
        Text("Código de país: " + data.countryCode.toString()),
        Text("Región: " + data.region.toString()),
        Text("Código de región: " + data.regionCode.toString()),
        Text("Ciudad: " + data.city.toString()),
        Text("Latitud: " + data.latitude.toString()),
        Text("Longitud: " + data.longitude.toString()),
        Text("Código postal: " + data.postal.toString()),
        Text("Lada: " + data.callingCode.toString()),
        Text("La ip es: " + data.ip.toString()),
        Text("La ip es: " + data.ip.toString()),
      ],
    );
  }
}
