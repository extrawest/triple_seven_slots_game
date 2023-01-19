import 'package:flutter/foundation.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/models/lottie_type.dart';
import 'package:triple_seven_slots_game/models/prize.dart';

@immutable
class SlotMachineRepository {
  static const Map<int, Prize> prizes = <int, Prize>{
    0: Prize(
      asset: seventhIc,
      prizeType: PrizeType.seventh,
      name: 'Jackpot',
      lottieType: LottieType.goldenConfetti,
    ),
    1: Prize(
      asset: cherryIc,
      prizeType: PrizeType.cherry,
      name: 'Cherry',
      lottieType: LottieType.goldenConfetti,
    ),
    2: Prize(
      asset: appleIc,
      prizeType: PrizeType.apple,
      name: 'Apple',
      lottieType: LottieType.confetti,
    ),
    3: Prize(
      asset: crownIc,
      prizeType: PrizeType.crown,
      name: 'Crown',
      lottieType: LottieType.confetti,
    ),
    4: Prize(
      asset: barIc,
      prizeType: PrizeType.bar,
      name: 'Bar',
      lottieType: LottieType.confetti,
    ),
    5: Prize(
      asset: coinIc,
      prizeType: PrizeType.coin,
      name: 'Coins',
      lottieType: LottieType.confetti,
    ),
    6: Prize(
      asset: lemonIc,
      prizeType: PrizeType.lemon,
      name: 'Lemon',
      lottieType: LottieType.confetti,
    ),
    7: Prize(
      asset: watermelonIc,
      prizeType: PrizeType.watermelon,
      name: 'Watermelon',
      lottieType: LottieType.confetti,
    ),
  };
}
