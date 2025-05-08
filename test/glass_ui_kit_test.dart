// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glass_ui_kit/glass_ui_kit.dart'; 

void main() {
  testWidgets('GlassContainer renders with given parameters', (
    WidgetTester tester,
  ) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GlassContainer(
            height: 100,
            width: 200,
            blur: 10,
            borderRadius: 15,
            backgroundColor: Colors.red.withOpacity(0.3),
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            child: const Text('Glass'),
          ),
        ),
      ),
    );

    // Verify that the child is rendered
    expect(find.text('Glass'), findsOneWidget);

    // Optionally, verify widget structure
    final glassContainerFinder = find.byType(GlassContainer);
    expect(glassContainerFinder, findsOneWidget);

    final containerWidget = tester.widget<GlassContainer>(glassContainerFinder);
    expect(containerWidget.height, 100);
    expect(containerWidget.width, 200);
    expect(containerWidget.blur, 10);
    expect(containerWidget.borderRadius, 15);
    expect(containerWidget.backgroundColor.opacity, 0.3);
  });
}
