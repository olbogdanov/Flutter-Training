import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Video Detail')), body: Detail());
  }
}

class Detail extends StatelessWidget {
  const Detail({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blueAccent,
            child:
            IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
          ),
          Text("Title of the video"),
          Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.thumb_up),
                Icon(Icons.thumb_down),
              ],
            ),
          )
        ],
      );
  }
}
