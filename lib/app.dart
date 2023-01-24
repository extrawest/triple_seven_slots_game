import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SlotMachineBloc>(create: (context) => SlotMachineBloc()),
      ],
      child: MaterialApp(
        title: 'Triple Seven Slots Game',
        routes: routes,
        initialRoute: mainMenuScreenRoute,
      ),
    );
  }
}
