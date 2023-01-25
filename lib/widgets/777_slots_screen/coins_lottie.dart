import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/widgets/common/common_lottie.dart';

class CoinsLottie extends StatelessWidget {
  final AnimationController animationController;
  const CoinsLottie({required this.animationController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLottie(
      lottieController: animationController,
      lottie: coinsLottie,
    );
  }
}
