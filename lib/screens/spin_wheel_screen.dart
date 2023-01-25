import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_button.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_wheel.dart';

class SpinWheelScreen extends StatelessWidget {
  final StreamController<int> _fortuneWheelNotifier = StreamController<int>();

  SpinWheelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<StreamController<int>>(
      create: (context) => _fortuneWheelNotifier,
      builder: (context, child) => GradientBackgroundScaffold(
        child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Flexible(child: SpinWheel()),
              Flexible(child: SpinButton()),
            ],
          ),
        ),
      ),
    );
  }
}
