import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';

abstract class UserDataRepository {
  Future<int?> getBalance();
  void setBalance(int balance);
  Future<DateTime?> getLastSpinDateTime();
  void updateLastSpinDateTime();
}

class UserDataRepositoryImpl implements UserDataRepository {
  final UserDataLocalStorage _userBalanceLocalStorage;

  UserDataRepositoryImpl({required UserDataLocalStorage userBalanceLocalStorage})
      : _userBalanceLocalStorage = userBalanceLocalStorage;

  @override
  Future<int?> getBalance() async {
    try {
      return await _userBalanceLocalStorage.getUserBalance();
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

  @override
  Future<DateTime?> getLastSpinDateTime() async {
    try {
      return await _userBalanceLocalStorage.getLastSpinDateTime();
    } catch (e) {}
    return null;
  }

  @override
  void updateLastSpinDateTime() {
    try {
      _userBalanceLocalStorage.updateLastSpinDateTime();
    } catch (e) {}
  }
}
