import 'package:brainup/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp initializes successfully and displays MaterialApp.router', (WidgetTester tester) async {
    // Launch the app within ProviderScope
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Wait for all animations and UI updates to settle
    await tester.pumpAndSettle();

    // Verify that MyApp contains a MaterialApp with router configuration
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
