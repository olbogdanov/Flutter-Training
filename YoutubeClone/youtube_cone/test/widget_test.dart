import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:youtube_cone/video_detail.dart';

void main() {
  testWidgets('should click on unsubscribe change a button state',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(400, 1000);
    // Build our app and trigger a frame.
    await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: VideoDetail(),
        )));
    await tester.dragUntilVisible(find.byType(TextButton),
        find.byType(SingleChildScrollView), Offset(0, 50));

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
