import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/widgets/layout.dart';

void main() {
  testWidgets('MainLayout displays child widget and header content', (WidgetTester tester) async {
    // This function will catch any Image.network calls within it and prevent the error.
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainLayout(
            child: Text('Test Child'),
          ),
        ),
      );

      // Your original checks will now pass because the image error is handled.
      expect(find.text('Test Child'), findsOneWidget);
      expect(find.text('NEW PRODUCTS OUT NOW!'), findsOneWidget);
    });
  });
}