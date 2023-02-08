import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';
import 'package:triple_seven_slots_game/screens/777_slots_screen.dart';
import 'package:triple_seven_slots_game/screens/spin_wheel_screen.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/control_panel.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/jackpot_spin_wheel.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';
import 'package:triple_seven_slots_game/widgets/common/common_spin_button.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_button.dart';
import 'package:triple_seven_slots_game/widgets/spin_wheel/spin_prize_dialog.dart';

import 'mocks.dart';

void main() {
  defineWidgetTests();
}

void defineWidgetTests() {
  slotMachineTests();
  spinWheelTests();
}

void slotMachineTests() {
  group('Slot Machine tests', () {
    testWidgets('''A test to check whether control panel increases 
        and decreases bet correctly(should add and remove 1000 by one tap)''', (tester) async {
      await tester.pumpWidget(
        _wrapper(const GradientBackgroundScaffold(child: ControlPanel())),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('5000'), findsOneWidget);

      final increaseButton = find.text('+');
      await tester.ensureVisible(increaseButton);
      await tester.tap(increaseButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.text('6000'), findsOneWidget);

      final decreaseButton = find.text('-');
      await tester.ensureVisible(decreaseButton);
      await tester.tap(decreaseButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.text('5000'), findsOneWidget);
    });

    testWidgets('Check if bet increasing is disabled after 20000', (tester) async {
      await tester.pumpWidget(
        _wrapper(const GradientBackgroundScaffold(child: ControlPanel())),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      int currentBet = defaultBet;
      expect(find.text(defaultBet.toString()), findsOneWidget);

      final increaseButton = find.text('+');
      while (currentBet < maxBet) {
        currentBet += differenceBet;
        await tester.tap(increaseButton);
        await tester.pump(const Duration(seconds: 2));
        await tester.pumpAndSettle();
      }
      expect(find.text(maxBet.toString()), findsOneWidget);
      await tester.tap(increaseButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      expect(find.text(maxBet.toString()), findsOneWidget);
    });

    testWidgets('Check if bet decreasing is disabled after 1000', (tester) async {
      await tester.pumpWidget(
        _wrapper(const GradientBackgroundScaffold(child: ControlPanel())),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      int currentBet = defaultBet;
      expect(find.text(defaultBet.toString()), findsOneWidget);

      final decreaseButton = find.text('-');
      while (currentBet > minBet) {
        currentBet -= differenceBet;
        await tester.tap(decreaseButton);
        await tester.pump(const Duration(seconds: 2));
        await tester.pumpAndSettle();
      }
      expect(find.text(minBet.toString()), findsOneWidget);
      await tester.tap(decreaseButton);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      expect(find.text(minBet.toString()), findsOneWidget);
    });

    testWidgets('Check if bet decreasing is disabled after 1000', (tester) async {
      setSharedPreferencesMockValues();
      await tester.pumpWidget(
        _wrapper(const GradientBackgroundScaffold(child: SevenSlotsScreen())),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Spin'));

      await tester.pump(const Duration(seconds: 4));
      await tester.pumpAndSettle();
    });
  });

  testWidgets('Check if bet changing is disabled while slot machine is spinning', (tester) async {
    setSharedPreferencesMockValues();
    await tester.pumpWidget(
      _wrapper(const GradientBackgroundScaffold(child: SevenSlotsScreen())),
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Spin'));
    await tester.pump();
    expect(find.text(defaultBet.toString()), findsOneWidget);

    await tester.tap(find.text('+'));
    expect(find.text(defaultBet.toString()), findsOneWidget);

    await tester.tap(find.text('-'));
    expect(find.text(defaultBet.toString()), findsOneWidget);
  });

  testWidgets('Show prize dialog after spinning slot machine', (tester) async {
    await tester.pumpWidget(
      _wrapper(const GradientBackgroundScaffold(child: JackpotSpinWheel(bet: defaultBet))),
    );
    await tester.tap(find.text('Spin'));
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    expect(find.byType(SpinPrizeDialog), findsOneWidget);
  });

  testWidgets('Whether button change from "spin" to "back" after jackpot spin wheel was spun',
      (tester) async {
    await tester.pumpWidget(
      _wrapper(const GradientBackgroundScaffold(child: JackpotSpinWheel(bet: defaultBet))),
    );
    await tester.tap(find.text('Spin'));
    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    expect(find.byType(SpinPrizeDialog), findsOneWidget);
    await tester.tapAt(const Offset(1, 1));
    await tester.pumpAndSettle();
    expect(find.text('Back'), findsOneWidget);
  });
}

void spinWheelTests() {
  group('Spin wheel tests', () {
    testWidgets('Check if prize dialog appears after slot machine stops', (tester) async {
      setSharedPreferencesMockValues();

      await tester.pumpWidget(_wrapper(SpinWheelScreen()));
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(SpinButton), findsOneWidget);

      final spinButton = find.byType(CommonButton);
      await tester.ensureVisible(spinButton);
      await tester.tap(spinButton);
      await tester.pump(const Duration(seconds: 6));
      await tester.pumpAndSettle();
      expect(find.byType(SpinPrizeDialog), findsOneWidget);
    });
  });
}

Widget _wrapper(Widget child) {
  final userDataLocaleStorage = UserDataLocalStorageImpl();
  final userDataRepository = UserDataRepositoryImpl(userBalanceLocalStorage: userDataLocaleStorage);
  return MaterialApp(
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SlotMachineBloc()),
        BlocProvider(create: (context) => SpinWheelCubit(userDataRepository: userDataRepository)),
        BlocProvider(
          create: (context) => UserBalanceCubit(
            userBalanceRepository: userDataRepository,
          ),
        ),
      ],
      child: child,
    ),
  );
}
