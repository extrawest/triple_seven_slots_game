import 'package:countup/countup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/theme.dart';

class BetCell extends StatelessWidget {
  final SlotMachineState slotMachineState;

  const BetCell({required this.slotMachineState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(cellIc),
        Countup(
          begin: slotMachineState.previousBet.toDouble(),
          end: slotMachineState.currentBet.toDouble(),
          style: TextStyles.clarendonReg22,
          duration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
