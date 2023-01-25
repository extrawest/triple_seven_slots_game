part of 'slot_machine_bloc.dart';

class SlotMachineState extends Equatable {
  final bool isSpinning;
  final List<int> prizeIndexes;
  final int? winPrizeIndex;
  final Prize? prize;

  final SlotMachineStatus slotMachineStatus;
  final BalanceStatus balanceStatus;

  final int currentBet;

  final int previousBet;

  final int userBalance;

  const SlotMachineState({
    this.prizeIndexes = const [],
    this.isSpinning = false,
    this.winPrizeIndex,
    this.prize,
    this.currentBet = defaultBet,
    this.slotMachineStatus = SlotMachineStatus.initial,
    this.balanceStatus = BalanceStatus.initial,
    this.previousBet = defaultBet,
    this.userBalance = 0,
  });

  SlotMachineState copyWith(
          {bool? isSpinning,
          List<int>? prizeIndexes,
          int? winPrizeIndex,
          Prize? prize,
          bool keepPrize = true,
          int? currentBet,
          int? previousBet,
          SlotMachineStatus? slotMachineStatus,
          BalanceStatus? balanceStatus,
          int? userBalance}) =>
      SlotMachineState(
        isSpinning: isSpinning ?? this.isSpinning,
        prizeIndexes: prizeIndexes ?? this.prizeIndexes,
        winPrizeIndex: winPrizeIndex ?? this.winPrizeIndex,
        prize: keepPrize ? (prize ?? this.prize) : null,
        currentBet: currentBet ?? this.currentBet,
        previousBet: previousBet ?? this.currentBet,
        slotMachineStatus: slotMachineStatus ?? this.slotMachineStatus,
        balanceStatus: balanceStatus ?? this.balanceStatus,
        userBalance: userBalance ?? this.userBalance,
      );

  @override
  List<Object?> get props => [
        isSpinning,
        prizeIndexes,
        winPrizeIndex,
        prize,
        currentBet,
        slotMachineStatus,
        balanceStatus,
        previousBet,
        userBalance,
      ];
}
