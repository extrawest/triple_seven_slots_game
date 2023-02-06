import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';

class MockUserRepository extends Mock implements UserDataLocalStorage {}

class MockSharedPreferences extends Mock implements SharedPreferences {}
