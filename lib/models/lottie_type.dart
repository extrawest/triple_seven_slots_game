enum LottieType {
  confetti,
  goldenConfetti,
}

extension LottieTypeExt on LottieType {
  bool get isConfetti => this == LottieType.confetti;
  bool get isGoldenConfetti => this == LottieType.goldenConfetti;
}
