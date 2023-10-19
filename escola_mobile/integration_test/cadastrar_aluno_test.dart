import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:escola_mobile/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Cadastrar Aluno', (tester) async {
    app.main();

    await tester.pumpAndSettle();
    await tester.tap(find.text('Alunos'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('CadastraAlunoButton')));
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(Key('NovoAlunoInput')), 'Aline Mattarazo');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(find.text('OK'));
    await tester.pump();
  });
}
