import 'package:flutter/material.dart';
import 'package:youtube_cone/home_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_cone/recommended_videos.dart';
import 'package:youtube_cone/video_detail.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'GoRouter Example: Declarative Routes',
      );

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Home(),
        ),
      ),
      GoRoute(
        path: '/page2',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: VideoDetail(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(),
    ),
  );
}

void main() {
  runApp(MyApp());
}
