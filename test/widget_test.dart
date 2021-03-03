// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bmical_flutterapp/components/bottombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmical_flutterapp/main.dart';

void main() {
  testWidgets(
      'When press bottom button get result page',
      (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BMICalculator());

    final button = find.byType(BottomButton);

    //ACT
    await tester.tap(button);
    await tester.pump();

    // ASSERT
    final icon = find.byIcon(Icons.play_arrow);

    expect(icon, findsOneWidget);
   
  });
}
