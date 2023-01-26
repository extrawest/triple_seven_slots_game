import 'package:shared_preferences/shared_preferences.dart';

const balanceKey = 'balance_key';
const firstTimeKey = 'first_time';
const lastSpinKey = 'last_spin';

abstract class UserDataLocalStorage {
  Future<int?> getUserBalance();
  void updateUserBalance(int balance);
  Future<DateTime?> getLastSpinDateTime();
  void updateLastSpinDateTime();
}

class UserDataLocalStorageImpl implements UserDataLocalStorage {
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

  @override
  Future<DateTime?> getLastSpinDateTime() async {
    try {
      if (sharedPreferences == null) {
        await init();
      }
      final lastSpinDateTime = sharedPreferences!.getString(lastSpinKey);
      if (lastSpinDateTime != null) {
        return DateTime.tryParse(lastSpinDateTime);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  void updateLastSpinDateTime() {
    try {
      sharedPreferences!.setString(lastSpinKey, DateTime.now().toString());
    } catch (e) {
      rethrow;
    }
  }
}
