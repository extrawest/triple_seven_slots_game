import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/database/user_data_local_storage.dart';
import 'package:triple_seven_slots_game/repositories/user_data_repository.dart';
import 'package:triple_seven_slots_game/routes.dart';

class App extends StatelessWidget {
  final UserDataRepository userDataRepository =
      UserDataRepositoryImpl(userBalanceLocalStorage: UserDataLocalStorageImpl());
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SlotMachineBloc>(
          create: (context) => SlotMachineBloc(),
        ),
        BlocProvider<SpinWheelCubit>(
            create: (context) => SpinWheelCubit(userDataRepository: userDataRepository)),
        BlocProvider<UserBalanceCubit>(
            create: (context) => UserBalanceCubit(userBalanceRepository: userDataRepository)),
      ],
      child: MaterialApp(
        title: 'Triple Seven Slots Game',
        builder: (context, child) =>
            ResponsiveWrapper.builder(child, defaultScale: true, breakpoints: [
          const ResponsiveBreakpoint.autoScale(500, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.autoScale(800, name: DESKTOP),
        ]),
        routes: routes,
        initialRoute: splashScreenRoute,
      ),
    );
  }
}
