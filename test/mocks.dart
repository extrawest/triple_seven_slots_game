import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';

const defaultBalance = 100000;

final lastSpinDate = DateTime(2023, 1, 1);

class MockUserRepository extends Mock implements UserDataLocalStorage {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void setSharedPreferencesMockValues() {
  SharedPreferences.setMockInitialValues(
      {balanceKey: defaultBalance, lastSpinKey: lastSpinDate.toString()});
}
