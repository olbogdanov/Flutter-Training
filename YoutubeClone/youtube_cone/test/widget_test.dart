// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:youtube_cone/main.dart';
import 'package:youtube_cone/video_detail.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    tester.binding.window.physicalSizeTestValue = Size(400, 1000);
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: VideoDetail(),));
    await tester.dragUntilVisible(find.byType(TextButton), find.byType(SingleChildScrollView), Offset(0, 50));


    // Verify that our counter starts at 0.
    expect(find.text('Unsubscribe'), findsOneWidget);
    expect(find.text('Subscribe'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byType(TextButton));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Unsubscribe'), findsNothing);
    expect(find.text('Subscribe'), findsOneWidget);
  });
}
