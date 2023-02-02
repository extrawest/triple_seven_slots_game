import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:triple_seven_slots_game/assets.dart';

class CoinsLottie extends StatelessWidget {
  final AnimationController animationController;
  const CoinsLottie({required this.animationController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IgnorePointer(
        child: Lottie.asset(
          coinsLottie,
          controller: animationController,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
