import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';

class MockUserRepository extends Mock implements UserDataLocalStorage {}

void main() {
  defineUnitTests();
}

void defineUnitTests() {
  group('user data repository tests', () {
    final userStorage = MockUserRepository();
    final userRepository = UserDataRepositoryImpl(userBalanceLocalStorage: userStorage);

    test('Test getting user balance', () async {
      const defaultBalance = 100000;
      when(() => userStorage.getUserBalance()).thenAnswer((_) async => defaultBalance);

      expect(await userRepository.getBalance(), defaultBalance);
    });

    test('Test getting last spin date', () async {
      final lastSpinDate = DateTime(2023, 1, 1);
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
