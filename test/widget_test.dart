// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled14/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Add calories and check total', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CalorieCounterApp());

    // Verify that our app has a title
    expect(find.text('Kalori Hesaplama'), findsOneWidget);

    // Add calories
    await tester.enterText(find.byType(TextField), '100');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the total calories are updated
    expect(find.text('100'), findsOneWidget);

    // Add more calories
    await tester.enterText(find.byType(TextField), '150');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the total calories are updated
    expect(find.text('250'), findsOneWidget);
  });

  testWidgets('Add invalid calories', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CalorieCounterApp());

    // Add invalid calories (text instead of numbers)
    await tester.enterText(find.byType(TextField), 'abc');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the total calories remain unchanged
    expect(find.text('0'), findsOneWidget);
  });
}
