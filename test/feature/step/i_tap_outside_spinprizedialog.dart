import 'package:flutter_test/flutter_test.dart';

Future<void> iTapOutsideSpinprizedialog(WidgetTester tester) async {
  await tester.tapAt(const Offset(1, 1));
}
