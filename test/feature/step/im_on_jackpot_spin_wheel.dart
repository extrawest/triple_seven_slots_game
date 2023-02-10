import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/jackpot_spin_wheel.dart';

Future<void> imOnJackpotSpinWheel(WidgetTester tester) async {
  final userDataLocaleStorage = UserDataLocalStorageImpl();
  final userDataRepository = UserDataRepositoryImpl(userBalanceLocalStorage: userDataLocaleStorage);
  await tester.pumpWidget(MaterialApp(
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpinWheelCubit(userDataRepository: userDataRepository)),
        BlocProvider(
          create: (context) => UserBalanceCubit(
            userBalanceRepository: userDataRepository,
          ),
        ),
      ],
      child: const Scaffold(body: Center(child: JackpotSpinWheel(bet: defaultBet))),
    ),
  ));
}
