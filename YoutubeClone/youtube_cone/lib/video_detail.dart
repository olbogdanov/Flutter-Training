import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_cone/recommended_videos.dart';

class VideoDetail extends StatelessWidget {
  const VideoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = SubscribeState();
    return Scaffold(
      appBar: AppBar(title: const Text('Video Detail')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600 && constraints.maxHeight > 400) {
            return WideVideoContainer(subscribeState: state);
          } else {
            return NormalVideoContainer(
              subscribeState: state,
            );
          }
        },
      ),
    );
  }
}

class NormalVideoContainer extends StatelessWidget {
  NormalVideoContainer({Key? key, required this.subscribeState})
      : super(key: key);
  final SubscribeState subscribeState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainVideoContainer(
            subscribeState: subscribeState,
          ),
          const RecommendedVideos()
        ],
      ),
    );
  }
}

// var sizeOfHalf = MediaQuery.of(context).size.width / 2
class WideVideoContainer extends StatelessWidget {
  const WideVideoContainer({Key? key, required this.subscribeState})
      : super(key: key);
  final SubscribeState subscribeState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MainVideoContainer(
            subscribeState: subscribeState,
          ),
          flex: 2,
        ),
        Expanded(
          child: RecommendedVideos(
            isScrolable: true,
          ),
          flex: 1,
        ),
      ],
    );
  }
}

class MainVideoContainer extends StatelessWidget {
  MainVideoContainer({Key? key, required this.subscribeState})
      : super(key: key);
  final SubscribeState subscribeState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.blueAccent,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.play_arrow)),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Title of the video",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.orange)),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: const [Icon(Icons.thumb_up), Text("4.2k")]),
              Column(children: const [Icon(Icons.thumb_down), Text("Dislike")]),
              Column(children: const [Icon(Icons.share), Text("Share")]),
              Column(children: const [Icon(Icons.save), Text("Save")]),
              SubscribeButton(
                subscribeState: subscribeState,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SubscribeButton extends StatefulWidget {
  const SubscribeButton({Key? key, required this.subscribeState})
      : super(key: key);
  final SubscribeState subscribeState;

  @override
  _SubscribeButtonState createState() => _SubscribeButtonState(subscribeState);
}

class _SubscribeButtonState extends State<SubscribeButton> {
  // bool isSubscribed = false;

  _SubscribeButtonState(this.subscribeState);

  SubscribeState subscribeState;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(subscribeState.isSubscribed ? "Subscribe" : "Unsubscribe"),
      onPressed: () {
        setState(() {
          subscribeState.isSubscribed = !subscribeState.isSubscribed;
        });
      },
    );
  }
}

class SubscribeState {
  bool isSubscribed = false;
}
