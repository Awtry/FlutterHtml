import 'package:flutter/material.dart';

import '../services/PlacesServices.dart';

class PlacePage extends StatefulWidget {
  PlacePage({Key? key}) : super(key: key);
  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  PlacesServices placesServices = PlacesServices();
  bool cargando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api Rest"),
        ),
        body: Container(
            child: FutureBuilder(
                future: placesServices.obtenerLugares(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Cargando . . ."),
                    );
                  }

                  return ListView.builder(
                      itemCount: snapshot.data.leght,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data[index].imagenNombre),
                            ),
                            title: Text(snapshot.data[index].nombre),
                            subtitle: Text(snapshot.data[index].descripcion),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlaceDatailPage(
                                            places: snapshot.data[index],
                                          )));
                            });
                      });
                })));
  }
}
