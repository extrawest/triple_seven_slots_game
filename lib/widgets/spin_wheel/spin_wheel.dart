import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_state.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/widgets/common/common_lottie.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/fortune_item.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_prize_dialog.dart';

class SpinWheel extends StatefulWidget {
  final String asset;
  final int defaultWin;
  const SpinWheel({required this.defaultWin, required this.asset, Key? key}) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> with SingleTickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SpinWheelCubit, SpinWheelState>(
      listenWhen: (prev, curr) => prev.isSpinning && !curr.isSpinning,
      listener: _spinWheelListener,
      child: SizedBox(
        height: 400,
        child: AbsorbPointer(
          child: Stack(
            children: [
              FortuneWheel(
                animateFirst: false,
                selected: context.read<StreamController<int>>().stream,
                rotationCount: 10,
                indicators: const [],
                items: List.generate(
                  7,
                  (index) => FortuneItem(
                    child: CustomFortuneItem(multiplier: index + 1, asset: widget.asset),
                    style: FortuneItemStyle(
                      color: index % 2 == 0 ? orange2 : orange1,
                      borderColor: darkOrange,
                    ),
                  ),
                ),
                onAnimationEnd: () {
                  context.read<SpinWheelCubit>().setIsSpinning(false);
                  context.read<SpinWheelCubit>().updateRotationCount();
                },
              ),
              Align(alignment: Alignment.center, child: Image.asset(wheelBorder)),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    spinningPointer,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _spinWheelListener(BuildContext context, SpinWheelState state) {
    if (state.currentPrizeMultiplier != null) {
      final prize = (state.currentPrizeMultiplier! + 1) * widget.defaultWin;
      showDialog(
        context: context,
        builder: (_) => Stack(
          alignment: Alignment.center,
          children: [
            SpinPrizeDialog(
              asset: widget.asset,
              coins: prize,
            ),
            CommonLottie(lottieController: _lottieController, lottie: confettiLottie),
          ],
        ),
      );
      _lottieController.forward().then((value) => _lottieController.reset());
      context.read<UserBalanceCubit>().updateUserBalance(prize);
    }
  }
}
