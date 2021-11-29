import 'package:flutter/material.dart';
import 'package:youtube_cone/home_widget.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Home',
      home: const Home(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

void main() {
  runApp(MyApp());
}
