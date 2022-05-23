import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/services/GeoService.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
              
              return _Uno(snapshot.data);
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
    geo.add(Text("Bandera: "));
    //geo.add(Image.asset(data.flag!.img, fit: BoxFit.cover));
    geo.add(Text("Conexión ISP: " + data.connection!.isp.toString()));
    geo.add(Text("Conexión Domain: " + data.connection!.domain.toString()));
    geo.add(Text("Ubicación horaria: " + data.timezone!.id.toString()));
    geo.add(Text("Hora actaual: " + data.timezone!.currentTime.toString()));

    return geo;
  }

  Widget _Uno(Geo data) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: ListView(
          restorationId: 'list_demo_list_view',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
              Text("Datos generales"),
              ListTile(
                title: Text(
                  data.ip.toString(),
                ),
                subtitle: Text("FUCK"),
              ),
              ListTile(
                title: Text(
                  data.success.toString(),
                ),
                subtitle: Text("Recolección exitosa"),
              ),
              ListTile(
                title: Text(
                  data.type.toString(),
                ),
                subtitle: Text("Tipo de conexión"),
              ),
          ],
        ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
      ],
    );
  }
}
