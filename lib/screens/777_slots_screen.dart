import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/slot_machine.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';

class SevenSlotsScreen extends StatelessWidget {
  const SevenSlotsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GradientBackgroundScaffold(
      child: SlotMachine(),
    );
  }
}
