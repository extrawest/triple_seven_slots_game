import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:triple_seven_slots_game/main.dart' as app;
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_prize_dialog.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  defineIntegrationTest();
}

void defineIntegrationTest() {
  testWidgets('', (tester) async {
    app.main();
    await tester.pump(const Duration(seconds: 10));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('spin_wheel')));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Spin'));
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    expect(find.byType(SpinPrizeDialog), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('BackButton')));
    await tester.pump();
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('BackButton')));
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('777_slots')));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    await tester.tap(find.text('+'));
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Spin'));
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    //final backCoordinates = tester.getCenter(find.byKey(const ValueKey('BackButton')));
    await tester.tapAt(const Offset(1, 1));
    await tester.pump();
    await tester.pumpAndSettle();
  });
}
