import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_state.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';

class SpinWheelCubit extends Cubit<SpinWheelState> {
  final UserDataRepository _userDataRepository;
  late Timer _spinWheelLockTimer;

  SpinWheelCubit({required UserDataRepository userDataRepository})
      : _userDataRepository = userDataRepository,
        super(const SpinWheelState());

  void setIsSpinning(bool isSpinning) {
    emit(state.copyWith(isSpinning: isSpinning));
  }

  void setPrize(int prizeMultiplier) {
    emit(state.copyWith(currentPrizeMultiplier: prizeMultiplier));
  }

  void updateSpinDate() {
    try {
      _userDataRepository.updateLastSpinDateTime();
      getLastSpinDate();
    } catch (e) {}
  }

  void getLastSpinDate() async {
    try {
      final lastSpinDate = await _userDataRepository.getLastSpinDateTime();
      if (lastSpinDate != null && !_checkIf8HoursPassed(lastSpinDate)) {
        _setTimer(lastSpinDate);
      }
      emit(state.copyWith(
        isWheelAvailable: lastSpinDate != null ? _checkIf8HoursPassed(lastSpinDate) : true,
      ));
    } catch (e) {
      print('');
    }
  }

  void _setTimer(DateTime lastSpinDate) {
    _spinWheelLockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //TODO: CHANGE Duration to 8 hours
      final unlockDate = lastSpinDate.add(const Duration(seconds: 20));
      final timeLeftDuration = -(DateTime.now().difference(unlockDate));
      if (timeLeftDuration.inSeconds == 0) {
        _spinWheelLockTimer.cancel();
        emit(state.copyWith(timeLeft: '00:00:00', isWheelAvailable: true));
      } else {
        final timeLeft = _formatDuration(timeLeftDuration);
        emit(state.copyWith(timeLeft: timeLeft));
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void updateRotationCount() {
    emit(state.copyWith(rotationCount: Random().nextInt(100) + 50));
  }

  bool _checkIf8HoursPassed(DateTime lastDate) {
    final differenceInHours = DateTime.now().difference(lastDate).inSeconds;
    return differenceInHours >= 20;
  }
}
