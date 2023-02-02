import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/theme.dart';

class SpinPrizeDialog extends StatefulWidget {
  final int coins;
  final String asset;
  const SpinPrizeDialog({required this.asset, required this.coins, Key? key}) : super(key: key);

  @override
  State<SpinPrizeDialog> createState() => _SpinPrizeDialogState();
}

class _SpinPrizeDialogState extends State<SpinPrizeDialog> with TickerProviderStateMixin {
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
          const Text('Congratulations!', style: TextStyles.clarendonReg24),
          const SizedBox(height: 10),
          const Text('You won!', style: TextStyles.clarendonReg22),
          const SizedBox(height: 10),
          SvgPicture.asset(widget.asset, width: 120),
          const SizedBox(height: 10),
          Text(widget.coins.toString(), style: TextStyles.clarendonReg18),
        ],
      ),
    );
  }
}
