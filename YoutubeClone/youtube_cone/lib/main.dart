import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView',
      home: const Home(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var spacecrafts = [
      "James Web",
      "Enterprise",
      "Hubble",
      "Kepler",
      "Juno",
      "Casini",
      "Columbia",
      "Challenger",
      "Huygens",
      "Galileo",
      "Apollo",
      "Spitzer",
      "WMAP",
      "Swift",
      "Atlantis"
    ];
    var listItem = ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Card(
            elevation: 5.0,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(spacecrafts[index]),
            ),
          ),
          onTap: () {},
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter ListView")),
      body: listItem,
    );
  }
}

void main() {
  runApp(MyApp());
}
