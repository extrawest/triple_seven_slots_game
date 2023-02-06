import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';
import 'package:triple_seven_slots_game/utils/extensions.dart';

import 'mocks.dart';

const defaultBalance = 100000;

final lastSpinDate = DateTime(2023, 1, 1);

void main() {
  defineUnitTests();
}

void defineUnitTests() {
  userDataRepositoryTests();

  userDataLocalStorageTest();

  balanceConvertExtensionTest();
}

void userDataRepositoryTests() {
  group('user data repository tests', () {
    final userStorage = MockUserRepository();
    final userRepository = UserDataRepositoryImpl(userBalanceLocalStorage: userStorage);

    test('Test getting user balance', () async {
      when(() => userStorage.getUserBalance()).thenAnswer((_) async => defaultBalance);

      expect(await userRepository.getBalance(), defaultBalance);
    });

    test('Test getting user balance', () async {
      when(() => userStorage.getUserBalance()).thenThrow(Exception('Something went wrong...'));

      expect(() async => await userRepository.getBalance(), throwsA(isA<Exception>()));
    });

    test('Test getting last spin date', () async {
      when(() => userStorage.getLastSpinDateTime()).thenAnswer((_) async => lastSpinDate);
      expect(await userRepository.getLastSpinDateTime(), lastSpinDate);
    });

    test('Test setting user balance', () async {
      when(() => userStorage.updateUserBalance(1000)).thenAnswer((_) async {});
      userRepository.setBalance(1000);
      verify(() => userStorage.updateUserBalance(1000)).called(1);
    });

    test('Test setting last spin date', () async {
      when(() => userStorage.updateLastSpinDateTime()).thenAnswer((_) async {});
      userRepository.updateLastSpinDateTime();
      verify(() => userStorage.updateLastSpinDateTime()).called(1);
    });
  });
}

void userDataLocalStorageTest() {
  SharedPreferences.setMockInitialValues(
      {balanceKey: defaultBalance, lastSpinKey: lastSpinDate.toString()});
  final UserDataLocalStorageImpl userDataLocalStorage = UserDataLocalStorageImpl();

  group('User local data storage tests', () {
    test('Test getting user balance', () async {
      expect(await userDataLocalStorage.getUserBalance(), defaultBalance);
    });

    test('Test getting last spin date', () async {
      expect(await userDataLocalStorage.getLastSpinDateTime(), lastSpinDate);
    });
  });
}

void balanceConvertExtensionTest() {
  group('balance converting extension tests', () {
    test('100 000 -> 100k test', () {
      const balance = 100000;

      expect(balance.cutBalance(), '100k');
    });

    test('25352 -> 25k test', () {
      const balance = 25352;

      expect(balance.cutBalance(), '25k');
    });

    test('250 -> 0.25k test', () {
      const balance = 250;

      expect(balance.cutBalance(), '0.25k');
    });
  });
}
