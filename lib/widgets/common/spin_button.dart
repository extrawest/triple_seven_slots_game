import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/theme.dart';

class CommonSpinButton extends StatelessWidget {
  const CommonSpinButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          playButton,
          width: 120,
        ),
        const Positioned(
          top: 15,
          left: 35,
          child: Text('Spin', style: TextStyles.clarendonReg22),
        ),
      ],
    );
  }
}
