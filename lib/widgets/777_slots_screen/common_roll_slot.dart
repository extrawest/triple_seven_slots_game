import 'package:flutter/material.dart';
import 'package:roll_slot_machine/roll_slot.dart';
import 'package:roll_slot_machine/roll_slot_controller.dart';

class CommonRollSlot extends StatelessWidget {
  final RollSlotController controller;
  final List<Widget> prizes;
  final double itemExtend;

  const CommonRollSlot({
    required this.itemExtend,
    required this.controller,
    required this.prizes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RollSlot(
      rollSlotController: controller,
      itemExtend: itemExtend,
      children: prizes,
    );
  }
}
