import 'package:flutter/material.dart';
import 'package:app_drawer/pages/primerPage.dart';
import 'package:app_drawer/pages/segundaPage.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, 
        children:[
          UserAccountsDrawerHeader(
            accountName: Text("Awtry"), 
            accountEmail: Text("arduatoaway@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.teal, 
              child: FlutterLogo(
                size: 42.0
              ),
            ),
            ),
            Ink(
              color: Colors.amber,
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text('Titilo', style: TextStyle(color: Colors.blueAccent)),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => primerPage()
                  ));
                },
              ),
            ),

          Divider(),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Segunda Página'), 
            onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => segundaPage()
                  ));
            }
          ),
        ]
      )
    );
  }
}

