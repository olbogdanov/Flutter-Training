import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      color: Colors.blueAccent,
      child: IconButton(
          onPressed: () {}, icon: const Icon(Icons.access_alarm_rounded)),
    );
  }
}
