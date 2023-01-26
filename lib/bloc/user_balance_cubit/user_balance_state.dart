import 'package:equatable/equatable.dart';
import 'package:triple_seven_slots_game/models/slot_machine_status.dart';

class UserBalanceState extends Equatable {
  final int userBalance;
  final BalanceStatus balanceStatus;

  const UserBalanceState({
    this.userBalance = 0,
    this.balanceStatus = BalanceStatus.initial,
  });

  UserBalanceState copyWith({
    int? userBalance,
    BalanceStatus? balanceStatus,
  }) =>
      UserBalanceState(
        userBalance: userBalance ?? this.userBalance,
        balanceStatus: balanceStatus ?? this.balanceStatus,
      );

  @override
  List<Object?> get props => [
        userBalance,
        balanceStatus,
      ];
}
