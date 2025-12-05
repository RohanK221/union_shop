import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/widgets/layout.dart';

void main() {
  testWidgets('MainLayout displays child widget and header content', (WidgetTester tester) async {

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainLayout(
            child: Text('Test Child'),
          ),
        ),
      );


      expect(find.text('Test Child'), findsOneWidget);
      expect(find.text('NEW PRODUCTS OUT NOW!'), findsOneWidget);
    });
  });
}