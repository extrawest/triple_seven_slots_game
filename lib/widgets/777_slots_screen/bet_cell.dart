import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/theme.dart';

class BetCell extends StatelessWidget {
  const BetCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotMachineBloc, SlotMachineState>(
      builder: (context, state) => Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(cellIc),
          Text(
            '${state.currentBet}',
            style: TextStyles.clarendonReg22,
          ),
        ],
      ),
    );
  }
}
