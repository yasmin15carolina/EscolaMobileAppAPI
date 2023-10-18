import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escola_mobile/main.dart';

void main() {
  testWidgets('Elementos da Home', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('HomeView')), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('CadastrarMatriculaView')), findsOneWidget);
  });
}
