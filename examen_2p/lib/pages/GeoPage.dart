import 'package:animate_do/animate_do.dart';
import 'package:examen_2p/data/Geo.dart';
import 'package:flutter/material.dart';
import 'package:examen_2p/services/GeoService.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:examen_2p/widgets/textfield_widget.dart';
import 'package:examen_2p/widgets/button_widget.dart';

import 'package:http/retry.dart';

class GeoPage extends StatefulWidget {
  GeoPage({Key? key}) : super(key: key);

  @override
  State<GeoPage> createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  @override
  void initState() {
    super.initState();
    objData = geoService.obtenerGeoPosicion();
  }

  GeoService geoService = new GeoService();
  GeoService geoServiceAUX = new GeoService();
  final TextEditingController _controllerIP = TextEditingController();

  var salida = "";
  Future<Geo>? objData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rastreador'),
      ),
      body: Container(
        child: FutureBuilder<Geo>(
          future: objData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              late Geo miau = snapshot.data;
              if (snapshot.hasData) {
                if (miau.success != false) {
                  return _Uno(snapshot.data);
                } else {
                  print("No se pudo");
                }
              }
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

  Widget _Uno(Geo data) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            child: TextFieldWidget(
                isPrefixIcon: true,
                prefixIconData: Icons.person,
                isSuffixIcon: true,
                sufixtIconData: Icons.verified_user,
                isMyControllerActivate: true,
                controller: _controllerIP,
                onsuffixIconTap: () {
                  print('Click');
                },
                hintText: 'Ip a rastrear',
                onChange: (String value) => {
                      setState(() {
                        print(value);
                        salida  = value;
                        //objData = geoService.obtenerGeoPosicion();
                      }),
                    }),
          ),
          Container(
            child: FadeInDown(
              child: ButtonWidget(
                title: 'Buscar',
                otherColor: false,
                width: 200.0,
                height: 40.0,
                colorButton: Color.fromARGB(255, 22, 107, 48),
                hasColor: false,
                onPressed: () {
                  if (_controllerIP.text.isEmpty == false) {
                    geoService.Nombre(salida);
                    objData = geoService.obtenerGeoPosicion();
                    return;
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.count(
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
                        //MARK: IP / Success / Type APARTADO 1
                        Text("Identificación"),
                        ListTile(
                          title: Text(
                            data.ip.toString(),
                          ),
                          subtitle: Text("Ip buscada"),
                        ),
                        ListTile(
                          title: Text(
                            data.success.toString(),
                          ),
                          subtitle: Text("Exito en recolección"),
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
                    color: Colors.teal[200],
                    child: ListView(
                      restorationId: 'list_demo_list_view',
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        //TODO: Continent / Country / Region APARTADO 2
                        Text("Datos generales"),
                        ListTile(
                          title: Text(
                            data.continent.toString(),
                          ),
                          subtitle: Text(data.continentCode.toString()),
                        ),
                        ListTile(
                          title: Text(
                            data.country.toString(),
                          ),
                          subtitle: Text(data.countryCode.toString()),
                        ),
                        ListTile(
                          title: Text(
                            data.region.toString(),
                          ),
                          subtitle: Text(data.regionCode.toString()),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: ListView(
                      restorationId: 'list_demo_list_view',
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        // TODO: APARTADO 3
                        Text("Especificación de ubicación"),
                        ListTile(
                          title: Text(
                            data.city.toString(),
                          ),
                          subtitle: Text("Ciudad"),
                        ),
                        ListTile(
                          title: Text(
                            data.latitude.toString(),
                          ),
                          subtitle: Text("Latitud"),
                        ),
                        ListTile(
                          title: Text(
                            data.longitude.toString(),
                          ),
                          subtitle: Text("Longitud"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: ListView(
                      restorationId: 'list_demo_list_view',
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        //TODO: APARTADO 4 CP / LADA / CAPITAL / BORDES
                        Text("Detalles extra"),
                        ListTile(
                          title: Text(
                            data.postal.toString(),
                          ),
                          subtitle: Text("Código postal"),
                        ),
                        ListTile(
                          title: Text(
                            data.callingCode.toString(),
                          ),
                          subtitle: Text("Lada"),
                        ),
                        ListTile(
                          title: Text(
                            data.borders.toString(),
                          ),
                          subtitle: Text("Bordes de país"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //TODO: APARTADO 5
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: SvgPicture.network(data.flag!.img.toString(),
                        semanticsLabel: 'Acme Logo'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: ListView(
                      restorationId: 'list_demo_list_view',
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        //TODO: APARTADO 6 ISP / DOMAIN
                        Text("Especificación de conexión"),
                        ListTile(
                          title: Text(
                            data.connection!.isp.toString(),
                          ),
                          subtitle: Text("ISP"),
                        ),
                        ListTile(
                          title: Text(
                            data.connection!.domain.toString(),
                          ),
                          subtitle: Text("Dominio"),
                        ),
                        ListTile(
                          title: Text(
                            data.connection!.org.toString(),
                          ),
                          subtitle: Text("Organización?"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: ListView(
                      restorationId: 'list_demo_list_view',
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        //TODO: APARTADO 7 / TimeZone / CurrentTime
                        Text("Hora del lugar"),
                        ListTile(
                          title: Text(
                            data.timezone!.id.toString(),
                          ),
                          subtitle: Text("Código horario"),
                        ),
                        ListTile(
                          title: Text(
                            data.timezone!.currentTime.toString(),
                          ),
                          subtitle: Text("Hora actual"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
