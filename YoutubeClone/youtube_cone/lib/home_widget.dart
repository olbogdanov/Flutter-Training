import 'package:flutter/material.dart';
import 'package:youtube_cone/recommended_videos.dart';
import 'package:youtube_cone/video_detail.dart';
import 'package:youtube_cone/video_widget.dart';

const spacecrafts = [
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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter ListView")),
      body: const RecommendedVideos(isScrolable: true,),
    );
  }
}
