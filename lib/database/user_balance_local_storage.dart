import 'package:shared_preferences/shared_preferences.dart';

const balanceKey = 'balance_key';
const firstTimeKey = 'first_time';

abstract class UserBalanceLocalStorage {
  Future<int?> getUserBalance();
  void updateUserBalance(int balance);
}

class UserBalanceLocalStorageImpl implements UserBalanceLocalStorage {
  SharedPreferences? sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<int?> getUserBalance() async {
    try {
      if (sharedPreferences == null) {
        await init();
      }
      return sharedPreferences!.getInt(balanceKey);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void updateUserBalance(int balance) {
    try {
      sharedPreferences!.setInt(balanceKey, balance);
    } catch (e) {
      rethrow;
    }
  }
}
