import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/theme.dart';

class BetCell extends StatefulWidget {
  const BetCell({Key? key}) : super(key: key);

  @override
  State<BetCell> createState() => _BetCellState();
}

class _BetCellState extends State<BetCell> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotMachineBloc, SlotMachineState>(
      builder: (context, state) => Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(cellIc),
          Countup(
            begin: state.previousBet.toDouble(),
            end: state.currentBet.toDouble(),
            style: TextStyles.clarendonReg22,
            duration: const Duration(milliseconds: 500),
          ),
        ],
      ),
    );
  }
}
