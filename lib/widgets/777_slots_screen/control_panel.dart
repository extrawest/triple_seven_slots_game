import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/bet_cell.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(angle: pi / -2, child: SvgPicture.asset(arrowLeftIc, width: 60)),
        const SizedBox(width: 5),
        const BetCell(),
        const SizedBox(width: 5),
        Transform.rotate(angle: pi / 2, child: SvgPicture.asset(arrowLeftIc, width: 60)),
        const SizedBox(width: 50),
        SvgPicture.asset(
          playButton,
          width: 120,
        ),
      ],
    );
  }
}
