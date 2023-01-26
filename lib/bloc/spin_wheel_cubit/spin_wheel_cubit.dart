import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_state.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';

class SpinWheelCubit extends Cubit<SpinWheelState> {
  final UserDataRepository _userDataRepository;
  SpinWheelCubit({required UserDataRepository userDataRepository})
      : _userDataRepository = userDataRepository,
        super(const SpinWheelState());

  void setIsSpinning(bool isSpinning) {
    emit(state.copyWith(isSpinning: isSpinning));
  }

  void setPrize(int prizeMultiplier) {
    emit(state.copyWith(currentPrizeMultiplier: prizeMultiplier));
  }

  void updateRotationCount() {
    emit(state.copyWith(rotationCount: Random().nextInt(100) + 50));
  }

  double generateRandomVelocity() => (Random().nextDouble() * 3000) + 2000;

  double generateRandomAngle() => Random().nextDouble() * pi * 2;
}
