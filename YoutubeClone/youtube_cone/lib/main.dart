import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter ListView',
      home: new Home(),
      theme: new ThemeData(primaryColor: Colors.orange),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    var spacecrafts = ["James Web","Enterprise","Hubble","Kepler","Juno","Casini","Columbia","Challenger","Huygens","Galileo","Apollo","Spitzer","WMAP","Swift","Atlantis"];
    var listItem = new ListView.builder(
      itemCount: spacecrafts.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new Text(spacecrafts[index]),
            ),
          ),
          onTap: () {

          },
        );
      },
    );

    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Flutter ListView")
      ),
      body: listItem,
    );
  }
}
void main() {
  runApp(new MyApp());
}