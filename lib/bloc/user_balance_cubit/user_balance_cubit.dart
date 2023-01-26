import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_state.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/models/slot_machine_status.dart';
import 'package:triple_seven_slots_game/repositories/user_balance_repository.dart';

class UserBalanceCubit extends Cubit<UserBalanceState> {
  final UserBalanceRepository _userBalanceRepository;

  UserBalanceCubit({required UserBalanceRepository userBalanceRepository})
      : _userBalanceRepository = userBalanceRepository,
        super(const UserBalanceState());

  void updateUserBalance(int balanceChange) {
    try {
      final newBalance = state.userBalance + balanceChange;
      _userBalanceRepository.setBalance(newBalance);
      emit(state.copyWith(userBalance: newBalance));
    } catch (e) {}
  }

  void fetchUserBalance() async {
    try {
      emit(state.copyWith(balanceStatus: BalanceStatus.loading));
      final balance = await _userBalanceRepository.getBalance();
      emit(state.copyWith(
          userBalance: balance ?? initialBalance, balanceStatus: BalanceStatus.loaded));
    } catch (e) {}
  }
}
