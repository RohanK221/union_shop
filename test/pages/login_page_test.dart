import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/login_page.dart';

void main() {
  testWidgets('navigates to login and shows LoginPage', (tester) async {
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    final nav = tester.state<NavigatorState>(find.byType(Navigator));
    nav.pushNamed('/login');
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
  });
}