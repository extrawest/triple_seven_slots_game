part of 'slot_machine_bloc.dart';

class SlotMachineState extends Equatable {
  final bool isSpinning;
  final List<List<int>> prizeIndexes;
  final int? winPrizeIndex;
  final int? winRow;

  final Prize? prize;

  final SlotMachineStatus slotMachineStatus;

  final int currentBet;

  final int previousBet;

  const SlotMachineState({
    this.prizeIndexes = const [],
    this.isSpinning = false,
    this.winPrizeIndex,
    this.winRow,
    this.prize,
    this.currentBet = defaultBet,
    this.slotMachineStatus = SlotMachineStatus.initial,
    this.previousBet = defaultBet,
  });

  SlotMachineState copyWith({
    bool? isSpinning,
    List<List<int>>? prizeIndexes,
    int? winPrizeIndex,
    int? winRow,
    Prize? prize,
    bool keepPrize = true,
    int? currentBet,
    int? previousBet,
    SlotMachineStatus? slotMachineStatus,
  }) =>
      SlotMachineState(
        isSpinning: isSpinning ?? this.isSpinning,
        prizeIndexes: prizeIndexes ?? this.prizeIndexes,
        winPrizeIndex: winPrizeIndex ?? this.winPrizeIndex,
        winRow: winRow ?? this.winRow,
        prize: keepPrize ? (prize ?? this.prize) : null,
        currentBet: currentBet ?? this.currentBet,
        previousBet: previousBet ?? this.currentBet,
        slotMachineStatus: slotMachineStatus ?? this.slotMachineStatus,
      );

  @override
  List<Object?> get props => [
        isSpinning,
        prizeIndexes,
        winPrizeIndex,
        winRow,
        prize,
        currentBet,
        slotMachineStatus,
        previousBet,
      ];
}
