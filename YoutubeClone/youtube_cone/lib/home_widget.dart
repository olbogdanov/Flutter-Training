import 'package:flutter/material.dart';

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
              child: VideoWidget(url: spacecrafts[index]),
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

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Text(url);
  }
}
