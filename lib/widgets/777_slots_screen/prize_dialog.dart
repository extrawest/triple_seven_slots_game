import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/models/prize.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/widgets/common/common_mouse_region.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PrizeDialog extends StatefulWidget {
  final Prize prize;
  const PrizeDialog({required this.prize, Key? key}) : super(key: key);

  @override
  State<PrizeDialog> createState() => _PrizeDialogState();
}

class _PrizeDialogState extends State<PrizeDialog> with TickerProviderStateMixin {
  late final AnimationController _scaleAnimationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    _scaleAnimationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)..forward();
    _scaleAnimation = CurvedAnimation(parent: _scaleAnimationController, curve: Curves.bounceOut);

    super.initState();
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.prize.asset),
          const SizedBox(height: 20),
          Text(widget.prize.name, style: TextStyles.bodyReg24),
          const SizedBox(height: 40),
          Transform.rotate(
            angle: pi,
            child: CommonMouseRegion(
              child: ZoomTapAnimation(
                onTap: () => Navigator.pop(context),
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
