import 'package:flutter_test/flutter_test.dart';

Future<void> iWaitFor1Second(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 1));
}
