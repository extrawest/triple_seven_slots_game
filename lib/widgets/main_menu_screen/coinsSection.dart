import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_state.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/utils/extensions.dart';

class CoinsSection extends StatelessWidget {
  const CoinsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBalanceCubit, UserBalanceState>(
      builder: (context, state) {
        final balance = state.userBalance.cutBalance();
        return Stack(
          children: [
            SvgPicture.asset(coinsSection),
            Positioned(
              right: 10,
              top: 20,
              child: Text(
                balance,
                style: balance.length > 4 ? TextStyles.clarendonReg18 : TextStyles.clarendonReg22,
              ),
            ),
          ],
        );
      },
    );
  }
}
