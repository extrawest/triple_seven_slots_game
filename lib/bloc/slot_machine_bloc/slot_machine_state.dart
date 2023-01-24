import 'package:equatable/equatable.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/models/prize.dart';
import 'package:triple_seven_slots_game/models/slot_machine_status.dart';

class SlotMachineState extends Equatable {
  final bool isSpinning;
  final List<int> prizeIndexes;
  final int? winPrizeIndex;
  final Prize? prize;

  final SlotMachineStatus slotMachineStatus;

  final int currentBet;

  const SlotMachineState({
    this.prizeIndexes = const [],
    this.isSpinning = false,
    this.winPrizeIndex,
    this.prize,
    this.currentBet = defaultBet,
    this.slotMachineStatus = SlotMachineStatus.initial,
  });

  SlotMachineState copyWith({
    bool? isSpinning,
    List<int>? prizeIndexes,
    int? winPrizeIndex,
    Prize? prize,
    int? currentBet,
    SlotMachineStatus? slotMachineStatus,
  }) =>
      SlotMachineState(
        isSpinning: isSpinning ?? this.isSpinning,
        prizeIndexes: prizeIndexes ?? this.prizeIndexes,
        winPrizeIndex: winPrizeIndex ?? this.winPrizeIndex,
        prize: prize ?? this.prize,
        currentBet: currentBet ?? this.currentBet,
        slotMachineStatus: slotMachineStatus ?? this.slotMachineStatus,
      );

  @override
  List<Object?> get props => [
        isSpinning,
        prizeIndexes,
        winPrizeIndex,
        prize,
        currentBet,
        slotMachineStatus,
      ];
}
