import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/order.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  testWidgets('OrderSummaryScreen shows correct item text and total RM 25.00',
      (WidgetTester tester) async {
    final testItems = [
      OrderItem(name: 'Vegetable Pizza', quantity: 1, unitPrice: 15.00),
      OrderItem(name: 'Box of Fries', quantity: 2, unitPrice: 5.00),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: OrderSummaryScreen(items: testItems),
      ),
    );

    // Verify item texts
    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);

    // Verify total display
    expect(find.text('RM 25.00'), findsWidgets);
  });
}
