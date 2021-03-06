import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_cone/recommended_videos.dart';

class VideoDetail extends StatelessWidget {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Detail')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return WideVideoContainer(
              descriptionKey: _key,
            );
          } else {
            return NormalVideoContainer(
              descriptionKey: _key,
            );
          }
        },
      ),
    );
  }
}

class NormalVideoContainer extends StatelessWidget {
  NormalVideoContainer({
    Key? key,
    required this.descriptionKey,
  }) : super(key: key);
  final Key descriptionKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainVideoContainer(
            key: descriptionKey,
          ),
          const RecommendedVideos()
        ],
      ),
    );
  }
}

// var sizeOfHalf = MediaQuery.of(context).size.width / 2
class WideVideoContainer extends StatelessWidget {
  WideVideoContainer({
    Key? key,
    required this.descriptionKey,
  }) : super(key: key);
  final Key descriptionKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MainVideoContainer(
            key: descriptionKey,
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

@immutable
class MainVideoContainer extends StatefulWidget {
  const MainVideoContainer({Key? key}) : super(key: key);

  @override
  State<MainVideoContainer> createState() => _MainVideoContainerState();
}

class _MainVideoContainerState extends State<MainVideoContainer>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 26), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object???s value.
        });
      })
      ..addStatusListener((status) {
        setState(() {});
      });
    controller.forward();
  }

  @override
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
        PlayBar(animation.value),
        playButton(duration: Duration(seconds: 2)),
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                      children: const [Icon(Icons.thumb_up), Text("4.2k")])),
              Expanded(
                  child: Column(children: const [
                Icon(Icons.thumb_down),
                Text("Dislike")
              ])),
              Expanded(
                  child: Column(
                      children: const [Icon(Icons.share), Text("Share")])),
              Expanded(
                  child:
                      Column(children: const [Icon(Icons.save), Text("Save")])),
              SubscribeButton()
            ],
          ),
        ),
      ],
    );
  }
}

class playButton extends StatefulWidget {
  final Duration duration;

  const playButton({Key? key, required this.duration}) : super(key: key);

  @override
  _playButtonState createState() => _playButtonState();
}

class _playButtonState extends State<playButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void didUpdateWidget(playButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _controller.forward();
        },
        icon:
            AnimatedIcon(icon: AnimatedIcons.play_pause, progress: animation));
  }
}

class PlayBar extends StatelessWidget {
  double _progress;
  PlayBar(this._progress);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.green,
          height: 5,
          width: MediaQuery.of(context).size.width * _progress,
        ),
      ],
    );
  }
}

class SubscribeButton extends StatefulWidget {
  const SubscribeButton({Key? key}) : super(key: key);

  @override
  _SubscribeButtonState createState() => _SubscribeButtonState();
}

class _SubscribeButtonState extends State<SubscribeButton> {
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        child: Text(isSubscribed ? "Subscribe" : "Unsubscribe"),
        style: TextButton.styleFrom(
          backgroundColor: isSubscribed ? Colors.red : Colors.grey,
          primary: Colors.white,
        ),
        onPressed: () {
          setState(() {
            isSubscribed = !isSubscribed;
          });
        },
      ),
    );
  }
}
