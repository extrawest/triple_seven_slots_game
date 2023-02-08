// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/prize_dialog.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_prize_dialog.dart';

import './step/i_see_text.dart';
import './step/i_see_widget.dart';
import './step/i_tap_outside_spinprizedialog.dart';
import './step/i_tap_text.dart';
import './step/i_wait_for1_second.dart';
import './step/i_wait_for6_seconds.dart';
import './step/im_on_jackpot_spin_wheel.dart';
import './step/im_on_slot_machine_screen.dart';

void main() {
  group('''Slot Machine''', () {
    testWidgets('''Outline: User increases bet ('+', '6000')''', (tester) async {
      await imOnSlotMachineScreen(tester);
      await iTapText(tester, '+');
      await iWaitFor1Second(tester);
      await iSeeText(tester, '6000');
    });
    testWidgets('''Outline: User increases bet ('-', '4000')''', (tester) async {
      await imOnSlotMachineScreen(tester);
      await iTapText(tester, '-');
      await iWaitFor1Second(tester);
      await iSeeText(tester, '4000');
    });
    testWidgets('''User spins jackpot wheel''', (tester) async {
      await imOnJackpotSpinWheel(tester);
      await iTapText(tester, 'Spin');
      await iWaitFor6Seconds(tester);
      await iSeeWidget(tester, SpinPrizeDialog);
    });
    testWidgets('''User spins slot machine''', (tester) async {
      await imOnSlotMachineScreen(tester);
      await iTapText(tester, 'Spin');
      await iWaitFor6Seconds(tester);
      await iSeeWidget(tester, PrizeDialog);
    });
    testWidgets('''Initial bet is 5000''', (tester) async {
      await imOnSlotMachineScreen(tester);
      await iSeeText(tester, '5000');
    });
    testWidgets(
        '''User spins jackpot wheel spin button should be replaced with back button after''',
        (tester) async {
      await imOnJackpotSpinWheel(tester);
      await iTapText(tester, 'Spin');
      await iWaitFor6Seconds(tester);
      await iSeeWidget(tester, SpinPrizeDialog);
      await iTapOutsideSpinprizedialog(tester);
      await iSeeText(tester, 'Back');
    });
  });
}
