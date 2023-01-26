import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_state.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/widgets/common/spin_button.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_wheel.dart';

class JackpotSpinWheel extends StatefulWidget {
  final int bet;
  const JackpotSpinWheel({required this.bet, Key? key}) : super(key: key);

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
    return Provider<StreamController<int>>(
      create: (context) => StreamController<int>(),
      builder: (context, child) => BlocBuilder<SpinWheelCubit, SpinWheelState>(
        builder: (context, state) => Column(
          children: [
            Flexible(
              child: SpinWheel(
                asset: seventhIc,
                defaultWin: widget.bet * jackPotMultiplier,
              ),
            ),
            const SizedBox(height: 10),
            state.isJackpotWheelSpinComplete
                ? CommonButton(onTap: () => Navigator.pop(context), title: 'Back')
                : CommonButton(
                    onTap: () {
                      final random = Fortune.randomInt(0, 6);
                      context.read<StreamController<int>>().sink.add(random);
                      context.read<SpinWheelCubit>().setIsSpinning(true);
                      context.read<SpinWheelCubit>().setPrize(random);
                      context.read<SpinWheelCubit>().setIsJackpotWheelComplete(true);
                    },
                    title: 'Spin',
                  ),
          ],
        ),
      ),
    );
  }
}
