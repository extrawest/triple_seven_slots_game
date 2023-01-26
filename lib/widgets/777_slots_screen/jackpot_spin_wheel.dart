import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_state.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/jackpot_prize_dialog.dart';
import 'package:triple_seven_slots_game/widgets/common/spin_button.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_wheel.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class JackpotSpinWheel extends StatefulWidget {
  const JackpotSpinWheel({Key? key}) : super(key: key);

  @override
  State<JackpotSpinWheel> createState() => _JackpotSpinWheelState();
}

class _JackpotSpinWheelState extends State<JackpotSpinWheel> with SingleTickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SpinWheelCubit, SpinWheelState>(
      listenWhen: (prev, curr) => prev.isSpinning && !curr.isSpinning,
      listener: _spinListener,
      child: Column(
        children: [
          const SpinWheel(asset: seventhIc),
          const SizedBox(height: 10),
          ZoomTapAnimation(
            onTap: () {
              final random = Fortune.randomInt(0, 6);
              context.read<StreamController<int>>().sink.add(random);
              context.read<SpinWheelCubit>().setIsSpinning(true);
              context.read<SpinWheelCubit>().setPrize(random);
            },
            child: const CommonSpinButton(),
          ),
        ],
      ),
    );
  }

  void _spinListener(BuildContext context, SpinWheelState state) {
    if (state.currentPrizeMultiplier != null) {
      _showPrizeDialog(state.currentPrizeMultiplier!);
    }
  }

  void _showPrizeDialog(int multiplier) {
    showDialog(context: context, builder: (context) => JackpotPrizeDialog(multiplier: multiplier));
  }
}
