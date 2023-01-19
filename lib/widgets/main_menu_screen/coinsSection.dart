import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/theme.dart';

class CoinsSection extends StatelessWidget {
  const CoinsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(coinsSection),
        const Positioned(
          right: 17,
          top: 21,
          child: Text(
            '100k',
            style: TextStyles.bodyReg22,
          ),
        ),
      ],
    );
  }
}
