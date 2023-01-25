import 'package:equatable/equatable.dart';

class SpinWheelState extends Equatable {
  final bool isSpinning;
  final int? currentPrizeMultiplier;
  final int rotationCount;

  const SpinWheelState({
    this.currentPrizeMultiplier,
    this.isSpinning = false,
    this.rotationCount = 10,
  });

  SpinWheelState copyWith({
    bool? isSpinning,
    int? currentPrizeMultiplier,
    int? rotationCount,
  }) {
    return SpinWheelState(
      isSpinning: isSpinning ?? this.isSpinning,
      currentPrizeMultiplier: currentPrizeMultiplier ?? this.currentPrizeMultiplier,
      rotationCount: rotationCount ?? this.rotationCount,
    );
  }

  @override
  List<Object?> get props => [
        isSpinning,
        currentPrizeMultiplier,
        rotationCount,
      ];
}
