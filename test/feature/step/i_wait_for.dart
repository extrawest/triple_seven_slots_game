import 'package:flutter_test/flutter_test.dart';

Future<void> iWaitFor(WidgetTester tester) async {
  await tester.pumpAndSettle();
}
