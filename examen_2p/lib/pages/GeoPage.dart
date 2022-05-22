import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/services/GeoService.dart';

class GeoPage extends StatefulWidget {
  GeoPage({Key? key}) : super(key: key);

  @override
  State<GeoPage> createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  GeoService geoService = new GeoService();
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miaaaaauuuuuuuuuuuuuuuuuuuuu'),
      ),
      body: Container(
        child: FutureBuilder(
          future: geoService.obtenerGeoPosicion(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);

              return ListView(
                  // children: generalidad(snapshot.data),
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
  List<Widget> generalidad(List<Geo> data) {
    List<Widget> geo = [];

    for (var geos in data) {
      geo.add(Text(data));
    }
  }*/
}
