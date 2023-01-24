import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/bet_cell.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChangeBetButton(
          angle: pi / -2,
          asset: arrowLeftIc,
          onPressed: () => context.read<SlotMachineBloc>().add(const DecreaseBet()),
        ),
        const SizedBox(width: 5),
        const BetCell(),
        const SizedBox(width: 5),
        _buildChangeBetButton(
          angle: pi / 2,
          asset: arrowLeftIc,
          onPressed: () => context.read<SlotMachineBloc>().add(const IncreaseBet()),
        ),
        const SizedBox(width: 50),
        SvgPicture.asset(
          playButton,
          width: 120,
        ),
      ],
    );
  }

  Widget _buildChangeBetButton({
    required double angle,
    required Function() onPressed,
    required String asset,
  }) {
    return Transform.rotate(
      angle: angle,
      child: ZoomTapAnimation(
        onTap: onPressed,
        child: SvgPicture.asset(asset, width: 60),
      ),
    );
  }
}
