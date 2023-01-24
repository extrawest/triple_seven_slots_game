import 'package:shared_preferences/shared_preferences.dart';

const balanceKey = 'balance_key';

abstract class UserBalanceLocalStorage {
  int getUserBalance();
  void updateUserBalance(int balance);
}

class UserBalanceLocalStorageImpl implements UserBalanceLocalStorage {
  final SharedPreferences sharedPreferences;

  UserBalanceLocalStorageImpl({required this.sharedPreferences});

  @override
  int getUserBalance() {
    try {
      return sharedPreferences.getInt(balanceKey);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void updateUserBalance(int balance) {
    sharedPreferences.setInt(balanceKey, balance);
  }
}
