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
  const Detail({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                color: Colors.blueAccent,
                child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
              ),
            ),
            Text("Title of the video"),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.thumb_up),
                  Icon(Icons.thumb_down),
                ],
              ),
            ),
            RecommendedVideos()
          ],
        ),
      );
  }
}
