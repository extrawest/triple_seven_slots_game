import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_state.dart';
import 'package:triple_seven_slots_game/theme.dart';

class UserBalance extends StatelessWidget {
  const UserBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBalanceCubit, UserBalanceState>(
      buildWhen: (prev, curr) => prev.userBalance != curr.userBalance,
      builder: (context, state) {
        return BlocBuilder<SlotMachineBloc, SlotMachineState>(
          builder: (context, slotMachineState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  coinIc,
                  width: 30,
                ),
                Countup(
                  begin: (state.userBalance - slotMachineState.currentBet).toDouble(),
                  end: state.userBalance.toDouble(),
                  duration: const Duration(milliseconds: 500),
                  style: TextStyles.clarendonReg22,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
