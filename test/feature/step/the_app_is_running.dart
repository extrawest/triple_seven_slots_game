import 'package:flutter_test/flutter_test.dart';
import 'package:triple_seven_slots_game/app.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(App());
}
