import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100.0,
            backgroundColor: Color.fromARGB(255, 133, 189, 177),
            elevation: 1.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Image.asset("assets/Paimon_11.png",
                        width: 30, height: 40)),
                const Text(
                  'Galeria de personajes',
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: 'Arial', color: Colors.white),
                ),
              ],
            )),
        body: Column(
          children: [
            Container(
              height: 120.0,
              color: Color.fromARGB(255, 197, 238, 231),
              child: ListView(
                  padding: EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    itemColumn('Anemo', "assets/Anemo.png"),
                    itemColumn('Piro', "assets/Pyro.png"),
                    itemColumn('Electro', "assets/Electro.png"),
                    itemColumn('Geo', "assets/Geo.png"),
                    itemColumn('Dendro', "assets/Dendro.png"),
                    itemColumn('Cryo', "assets/Cryo.png"),
                    itemColumn('Hydro', "assets/Hydro.png"),
                  ]),
            ),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Anemo
                  child: Container(
                    child: Image.network(
                      'https://files.cults3d.com/uploaders/13460649/illustration-file/519a20e1-f70a-436e-9e02-94c20cde9a62/IMG_20201012_145538-01_large.jpeg',
                      width: 400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Pyro
                  child: Container(
                    child: Image.network(
                        'https://img1.cgtrader.com/items/2674279/0450d2e75e/amber-amulet-pyro-genshin-impact-3d-model-stl.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Electro
                  child: Container(
                    child: Image.network(
                        'https://files.cults3d.com/uploaders/13460649/illustration-file/7b0a90a9-d0c1-40dc-92bc-c98fac1be12d/electro%20mondstadt%20genshin%20impact%202.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //GEO
                  child: Container(
                    child: Image.network(
                        'https://files.cults3d.com/uploaders/13460649/illustration-file/1ec607b6-24c6-4e6e-812f-0df5bb9cebb7/LRM_20201123_151353.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Dendro
                  child: Container(
                    child: Image.network(
                        'https://img1.cgtrader.com/items/2674279/0450d2e75e/amber-amulet-pyro-genshin-impact-3d-model-stl.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Cryo
                  child: Container(
                    child: Image.network(
                        'https://images.cults3d.com/GKdfTZ-tOzNokP_QLL5LHJtdC8o=/516x516/https://files.cults3d.com/uploaders/13460649/illustration-file/ef8d2dc5-a60b-4e47-a6f0-466a2a0e4aa4/Cryo%201%20-%20genshin%20impact.png#1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Hydro
                  child: Container(
                    child: Image.network(
                        'https://images.cults3d.com/2kO8OobAH5sq-THjY3cF7EpYITw=/516x516/filters:format(webp)/https://files.cults3d.com/uploaders/14978118/photo-file/a64c2f77-045b-449b-a87b-5eb232777e85/122964133_10221211031478853_2513651911988137492_o.jpg'),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget itemColumn(String texto, String icono) {
    return InkWell(
        onTap: () {
          print('Lo has picado $texto');
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(icono, width: 30, height: 40),
                const Spacer(),
                Text(
                  texto,
                  style: const TextStyle(color: Color.fromARGB(255, 10, 2, 3)),
                )
              ],
            )));
  }
}
