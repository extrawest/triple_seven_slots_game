import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/control_panel.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';

void main() {
  defineWidgetTests();
}

void defineWidgetTests() {
  slotMachineTests();
}

void slotMachineTests() {
  group('Slot Machine tests', () {
    testWidgets('', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SlotMachineBloc()),
            BlocProvider(
              create: (context) => UserBalanceCubit(
                userBalanceRepository: UserDataRepositoryImpl(
                  userBalanceLocalStorage: UserDataLocalStorageImpl(),
                ),
              ),
            ),
          ],
          child: const GradientBackgroundScaffold(child: ControlPanel()),
        ),
      ));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('5000'), findsOneWidget);

      final increaseButton = find.byKey(increaseBetKey);
      await tester.ensureVisible(increaseButton);
      await tester.tap(increaseButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.text('6000'), findsOneWidget);
    });
  });
}
