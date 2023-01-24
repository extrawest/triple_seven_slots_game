import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(angle: pi / -2, child: SvgPicture.asset(arrowLeftIc, width: 60)),
        SvgPicture.asset(cellIc),
        Transform.rotate(angle: pi / 2, child: SvgPicture.asset(arrowLeftIc, width: 60)),
        const SizedBox(
          width: 50,
        ),
        SvgPicture.asset(
          playButton,
          width: 120,
        ),
      ],
    );
  }
}
