import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_cone/recommended_videos.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Video Detail')), body: Detail());
  }
}

class Detail extends StatelessWidget {
  const Detail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.blueAccent,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.play_arrow)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Title of the video"),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: const [Icon(Icons.thumb_up), Text("4.2k")]),
                Column(
                    children: const [Icon(Icons.thumb_down), Text("Dislike")]),
                Column(children: const [Icon(Icons.share), Text("Share")]),
                Column(children: const [Icon(Icons.save), Text("Save")])
              ],
            ),
          ),
          const RecommendedVideos()
        ],
      ),
    );
  }
}
