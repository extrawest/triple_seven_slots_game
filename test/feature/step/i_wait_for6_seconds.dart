import 'package:flutter_test/flutter_test.dart';

Future<void> iWaitFor6Seconds(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 15));
}
