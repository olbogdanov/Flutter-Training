import 'package:flutter/material.dart';
import 'package:youtube_cone/home_widget.dart';
import 'package:youtube_cone/video_detail.dart';
import 'package:youtube_cone/video_widget.dart';

class RecommendedVideos extends StatelessWidget {
  const RecommendedVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: spacecrafts.length,
      physics: NeverScrollableScrollPhysics(),
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
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const VideoDetail()));
          },
        );
      },
    );
  }
}
