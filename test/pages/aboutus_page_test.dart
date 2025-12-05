import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/aboutus_page.dart';

void main() {
  testWidgets('navigates to about us and shows AboutUsPage', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final nav = tester.state<NavigatorState>(find.byType(Navigator));
      nav.pushNamed('/about-us');
      await tester.pumpAndSettle();

      expect(find.byType(AboutUsPage), findsOneWidget);
    });
  });
}