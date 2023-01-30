import 'package:equatable/equatable.dart';
import 'package:triple_seven_slots_game/models/slot_machine_status.dart';

class UserBalanceState extends Equatable {
  final int userBalance;

  // for animated balance change
  final int previousBalance;

  final BalanceStatus balanceStatus;

  const UserBalanceState({
    this.userBalance = 0,
    this.balanceStatus = BalanceStatus.initial,
    this.previousBalance = 0,
  });

  UserBalanceState copyWith({
    int? userBalance,
    int? previousBalance,
    BalanceStatus? balanceStatus,
  }) =>
      UserBalanceState(
        userBalance: userBalance ?? this.userBalance,
        previousBalance: previousBalance ?? this.previousBalance,
        balanceStatus: balanceStatus ?? this.balanceStatus,
      );

  @override
  List<Object?> get props => [
        userBalance,
        previousBalance,
        balanceStatus,
      ];
}
