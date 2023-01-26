import 'package:equatable/equatable.dart';

class SpinWheelState extends Equatable {
  final bool isSpinning;
  final int? currentPrizeMultiplier;
  final int rotationCount;

  final bool isWheelAvailable;
  final String timeLeft;

  const SpinWheelState({
    this.currentPrizeMultiplier,
    this.isSpinning = false,
    this.rotationCount = 10,
    this.isWheelAvailable = false,
    this.timeLeft = '00:00:00',
  });

  SpinWheelState copyWith({
    bool? isSpinning,
    int? currentPrizeMultiplier,
    int? rotationCount,
    bool? isWheelAvailable,
    String? timeLeft,
  }) {
    return SpinWheelState(
      isSpinning: isSpinning ?? this.isSpinning,
      currentPrizeMultiplier: currentPrizeMultiplier ?? this.currentPrizeMultiplier,
      rotationCount: rotationCount ?? this.rotationCount,
      isWheelAvailable: isWheelAvailable ?? this.isWheelAvailable,
      timeLeft: timeLeft ?? this.timeLeft,
    );
  }

  @override
  List<Object?> get props => [
        isSpinning,
        currentPrizeMultiplier,
        rotationCount,
        isWheelAvailable,
        timeLeft,
      ];
}
