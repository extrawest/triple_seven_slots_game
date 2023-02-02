import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CommonLottie extends StatelessWidget {
  final String lottie;
  final AnimationController lottieController;

  const CommonLottie({
    required this.lottieController,
    required this.lottie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: IgnorePointer(
          child: Lottie.asset(
            lottie,
            controller: lottieController,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
