import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/theme.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlotMachineBloc, SlotMachineState>(
      buildWhen: (prev, curr) => prev.userBalance != curr.userBalance,
      builder: (context, state) {
        return Text(
          '${state.userBalance}',
          style: TextStyles.clarendonReg22,
        );
      },
    );
  }
}
