import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/theme.dart';

class CustomFortuneItem extends StatelessWidget {
  final int multiplier;
  final String asset;

  const CustomFortuneItem({required this.asset, required this.multiplier, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: const BoxDecoration(
        gradient: orangeGradientLight,
      ),
      child: Transform.rotate(
        angle: pi / 2,
        child: SizedBox(
          height: 90,
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(child: SvgPicture.asset(asset, height: 50)),
                  Positioned.fill(
                    top: 20,
                    left: 10,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(star),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'x$multiplier',
                            style: TextStyles.bodyReg16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
