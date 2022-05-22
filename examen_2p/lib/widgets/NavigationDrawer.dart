import 'package:flutter/material.dart';
import 'package:examen_2p/pages/GeoPage.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('No se para que es esto'),
            accountEmail: Text('Es miau . con'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person_add_alt_1_rounded),
            ),
          ),
          Ink(
            color: Color.fromARGB(255, 32, 99, 175),
            child: ListTile(
              leading: Icon(
                Icons.food_bank,
                color: Colors.white,
              ),
              title: Text(
                'Geo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GeoPage()));
              },
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
