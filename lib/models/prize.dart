import 'package:triple_seven_slots_game/models/lottie_type.dart';

class Prize {
  final PrizeType prizeType;
  final String asset;
  final String name;
  final LottieType lottieType;
  final int coins;

  const Prize({
    required this.asset,
    required this.prizeType,
    required this.name,
    required this.lottieType,
    required this.coins,
  });
}

enum PrizeType {
  bar,
  cherry,
  seventh,
  apple,
  lemon,
  coin,
  watermelon,
  crown,
}

extension PrizeTypeExt on PrizeType {
  bool get isBar => this == PrizeType.bar;
  bool get isCherry => this == PrizeType.cherry;
  bool get isSeventh => this == PrizeType.seventh;
  bool get isApple => this == PrizeType.apple;
  bool get isLemon => this == PrizeType.lemon;
  bool get isCoin => this == PrizeType.coin;
  bool get isWatermelon => this == PrizeType.watermelon;
  bool get isCrown => this == PrizeType.crown;
}
