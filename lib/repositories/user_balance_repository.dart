import 'package:triple_seven_slots_game/database/user_balance_local_storage.dart';

abstract class UserBalanceRepository {
  int getBalance();
  void setBalance(int balance);
}

class UserBalanceRepositoryImpl implements UserBalanceRepository {
  final UserBalanceLocalStorage _userBalanceLocalStorage;

  UserBalanceRepositoryImpl({required UserBalanceLocalStorage userBalanceLocalStorage})
      : _userBalanceLocalStorage = userBalanceLocalStorage;

  @override
  int getBalance() {
    try {
      return _userBalanceLocalStorage.getUserBalance();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void setBalance(int balance) {
    try {
      _userBalanceLocalStorage.updateUserBalance(balance);
    } catch (e) {
      rethrow;
    }
  }
}
