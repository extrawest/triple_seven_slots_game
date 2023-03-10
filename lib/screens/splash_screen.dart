import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_state.dart';
import 'package:triple_seven_slots_game/models/slot_machine_status.dart';
import 'package:triple_seven_slots_game/routes.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/utils/precaching.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    context.read<UserBalanceCubit>().fetchUserBalance();
    context.read<SpinWheelCubit>().getLastSpinDate();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundScaffold(
      child: BlocListener<UserBalanceCubit, UserBalanceState>(
        listener: (context, state) {
          if (state.balanceStatus.isLoaded) {
            Precaching().loadGraphics(context).then((_) {
              Navigator.pushReplacementNamed(context, mainMenuScreenRoute);
            });
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Triple Seven Slots Game',
              style: TextStyles.clarendonReg24,
            ),
            const SizedBox(height: 15),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animationController.value * 2 * pi),
                child: child,
              ),
              child: SvgPicture.asset(cherryIc, width: 50),
            ),
          ],
        ),
      ),
    );
  }
}
