import 'package:shared_preferences/shared_preferences.dart';

const balanceKey = 'balance_key';
const firstTimeKey = 'first_time';

abstract class UserBalanceLocalStorage {
  int? getUserBalance();
  void updateUserBalance(int balance);
}

class UserBalanceLocalStorageImpl implements UserBalanceLocalStorage {
  late final SharedPreferences sharedPreferences;

  UserBalanceLocalStorageImpl() {
    init();
  }

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  int? getUserBalance() {
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
