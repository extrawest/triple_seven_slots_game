// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_wait_for1_second.dart';
import './step/i_see_text.dart';
import './step/i_wait_for6_seconds.dart';

void main() {
  group('''Splash screen''', () {
    testWidgets('''App is precaching images and shows splash screen''', (tester) async {
      await theAppIsRunning(tester);
      await iWaitFor1Second(tester);
      await iSeeText(tester, 'Triple Seven Slots Game');
    });
    testWidgets('''App navigates to main screen after precaching''', (tester) async {
      await theAppIsRunning(tester);
      await iWaitFor6Seconds(tester);
      await iSeeText(tester, 'Triple Seven Slots');
    });
  });
}
