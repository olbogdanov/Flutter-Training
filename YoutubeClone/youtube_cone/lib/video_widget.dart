import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16/9,
          child: Container(
            color: Colors.blueAccent,
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
          ),
        ),
        VideoFooter(url: url),
      ],
    );
  }
}

class VideoFooter extends StatelessWidget {
  const VideoFooter({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
              "https://cdn1.vectorstock.com/i/1000x1000/23/70/man-avatar-icon-flat-vector-19152370.jpg"),
          child: Stack(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(url, style: TextStyle(color: Colors.black87)),
            Text("some description"),
          ],
        ),
      ],
    );
  }
}
