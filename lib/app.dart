import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/database/user_balance_local_storage.dart';
import 'package:triple_seven_slots_game/repositories/user_balance_repository.dart';
import 'package:triple_seven_slots_game/routes.dart';

class App extends StatelessWidget {
  final UserBalanceRepository userBalanceRepository =
      UserBalanceRepositoryImpl(userBalanceLocalStorage: UserBalanceLocalStorageImpl());
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SlotMachineBloc>(
          create: (context) => SlotMachineBloc(),
        ),
        BlocProvider<SpinWheelCubit>(create: (context) => SpinWheelCubit()),
        BlocProvider<UserBalanceCubit>(
            create: (context) => UserBalanceCubit(userBalanceRepository: userBalanceRepository)),
      ],
      child: MaterialApp(
        title: 'Triple Seven Slots Game',
        routes: routes,
        initialRoute: splashScreenRoute,
      ),
    );
  }
}
