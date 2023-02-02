import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/slot_machine.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SevenSlotsScreen extends StatelessWidget {
  const SevenSlotsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundScaffold(
      child: Stack(children: [
        const SlotMachine(),
        Positioned(
          top: 10,
          left: 10,
          child: ZoomTapAnimation(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(arrowLeftIc, width: 60),
          ),
        )
      ]),
    );
  }
}
