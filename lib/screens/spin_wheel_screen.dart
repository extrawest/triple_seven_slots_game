import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_state.dart';
import 'package:triple_seven_slots_game/theme.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: SpinWheel(),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: BlocBuilder<SpinWheelCubit, SpinWheelState>(
                builder: (context, state) => state.isWheelAvailable
                    ? const SpinButton()
                    : Text(
                        state.timeLeft,
                        style: TextStyles.clarendonReg22,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
