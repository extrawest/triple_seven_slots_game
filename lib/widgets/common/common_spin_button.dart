import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CommonButton({required this.onTap, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Stack(
        children: [
          SvgPicture.asset(
            playButton,
            width: 120,
          ),
          Positioned(
            top: 15,
            left: 35,
            child: Text(title, style: TextStyles.clarendonReg22),
          ),
        ],
      ),
    );
  }
}
