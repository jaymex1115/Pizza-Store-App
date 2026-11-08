import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('Test that the menu lists the three items', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('Test that tapping a card opens its detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    // Tap on the Vegetable Pizza card
    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    // Verify detail screen components are shown
    expect(find.text('Fresh bell peppers, onions, tomatoes, and mushrooms on a classic crust.'), findsOneWidget);
  });

  testWidgets('Test that the back button returns to the menu', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    // Navigate to Cheese Pizza screen
    await tester.tap(find.text('Cheese Pizza'));
    await tester.pumpAndSettle();

    // Tap the back button in AppBar
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    // Verify back on Menu screen
    expect(find.text('Pizza Store Menu'), findsOneWidget);
    expect(find.text('Vegetable Pizza'), findsOneWidget);
  });
}