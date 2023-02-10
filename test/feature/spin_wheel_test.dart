// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_button.dart';

import './step/i_see_text.dart';
import './step/i_see_widget.dart';
import './step/i_tap_text.dart';
import './step/i_wait_for1_second.dart';
import './step/i_wait_for6_seconds.dart';
import './step/im_on_spin_wheel_screen.dart';

void main() {
  group('''Spin Wheel''', () {
    testWidgets('''User taps spin wheel button and get prize dialog when it stops''',
        (tester) async {
      await imOnSpinWheelScreen(tester);
      await iTapText(tester, 'Spin');
      await iWaitFor6Seconds(tester);
      await iSeeText(tester, 'Congratulations!');
    });
    testWidgets('''User taps spin wheel button and then timer appears instead of it''',
        (tester) async {
      await imOnSpinWheelScreen(tester);
      await iSeeWidget(tester, SpinButton);
      await iTapText(tester, 'Spin');
      await iWaitFor1Second(tester);
      await iSeeText(tester, '00:00:00');
    });
    testWidgets('''Spin wheel multipliers must be from 1 to 7''', (tester) async {
      await imOnSpinWheelScreen(tester);
      await iSeeText(tester, 'x1');
      await iSeeText(tester, 'x2');
      await iSeeText(tester, 'x4');
      await iSeeText(tester, 'x5');
      await iSeeText(tester, 'x6');
      await iSeeText(tester, 'x7');
    });
  });
}
