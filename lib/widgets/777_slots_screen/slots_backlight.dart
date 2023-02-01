import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/theme.dart';

class SlotsBackLight extends StatefulWidget {
  const SlotsBackLight({Key? key}) : super(key: key);

  @override
  State<SlotsBackLight> createState() => _SlotsBackLightState();
}

class _SlotsBackLightState extends State<SlotsBackLight> with TickerProviderStateMixin {
  late final List<AnimationController> _animationControllers;

  @override
  void initState() {
    _animationControllers = List.generate(numberOfSlots * 3,
        (_) => AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward());
    super.initState();
  }

  @override
  void dispose() {
    for (final controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (columnIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    3,
                    (rowIndex) =>
                        _gradientBacklight(_animationControllers[rowIndex * columnIndex])),
              )),
    );
  }

  Widget _gradientBacklight(AnimationController animationController) {
    return FadeTransition(
      opacity: animationController,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: darkPurple1),
        ),
      ),
    );
  }
}
