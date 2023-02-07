import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/bet_cell.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

const decreaseBetKey = ValueKey('decrease_bet_key');
const increaseBetKey = ValueKey('increase_bet_key');

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotMachineBloc, SlotMachineState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChangeBetButton(
            key: decreaseBetKey,
            angle: pi / -2,
            title: '-', //arrowLeftIc,
            onPressed: state.isSpinning
                ? null
                : () => context.read<SlotMachineBloc>().add(const DecreaseBet()),
          ),
          const SizedBox(width: 5),
          BetCell(slotMachineState: state),
          const SizedBox(width: 5),
          ChangeBetButton(
            key: increaseBetKey,
            angle: pi / 2,
            title: '+',
            onPressed: state.isSpinning
                ? null
                : () => context.read<SlotMachineBloc>().add(const IncreaseBet()),
          ),
          const SizedBox(width: 50),
          ZoomTapAnimation(
            onTap: () => state.isSpinning ? null : _startSlotMachine(context),
            child: Stack(
              children: [
                SvgPicture.asset(
                  playButton,
                  width: 120,
                ),
                const Positioned(
                  top: 15,
                  left: 35,
                  child: Text('Spin', style: TextStyles.clarendonReg22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeBetButton({
    Key? key,
    required double angle,
    required void Function()? onPressed,
    required String asset,
  }) {
    return Transform.rotate(
      angle: angle,
      child: ZoomTapAnimation(
        onTap: onPressed,
        child: SvgPicture.asset(
          asset,
          width: 60,
          key: key,
        ),
      ),
    );
  }

  void _startSlotMachine(BuildContext context) {
    final bet = context.read<SlotMachineBloc>().state.currentBet;
    if (context.read<UserBalanceCubit>().state.userBalance >= bet) {
      context.read<SlotMachineBloc>().add(SpinMachineEvent(bet: bet));
      context.read<UserBalanceCubit>().updateUserBalance(-bet);
    }
  }
}

class ChangeBetButton extends StatelessWidget {
  final double angle;
  final Function()? onPressed;
  final String title;

  const ChangeBetButton({
    Key? key,
    required this.angle,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: ZoomTapAnimation(
        onTap: onPressed,
        child: Text(title),
        // child: SvgPicture.asset(
        //   asset,
        //   width: 60,
        //   key: key,
        // ),
      ),
    );
  }
}
