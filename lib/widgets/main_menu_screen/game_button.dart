import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/widgets/common/common_mouse_region.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GameButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String asset;
  final String title;

  const GameButton({
    required this.title,
    required this.onPressed,
    required this.asset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonMouseRegion(
      child: ZoomTapAnimation(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              asset,
              width: 150,
            ),
            Text(title, style: TextStyles.clarendonReg18),
          ],
        ),
      ),
    );
  }
}
