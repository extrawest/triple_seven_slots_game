import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/routes.dart';
import 'package:triple_seven_slots_game/theme.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';
import 'package:triple_seven_slots_game/widgets/main_menu_screen/coinsSection.dart';
import 'package:triple_seven_slots_game/widgets/main_menu_screen/game_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientBackgroundScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Stack(
              children: [
                SizedBox(width: size.width),
                const CoinsSection(),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Triple Seven Slots',
                      style: TextStyles.h2Bold32,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameButton(
                  onPressed: () => Navigator.pushNamed(context, sevenSlotsScreenRoute),
                  asset: seventhIc,
                ),
                const SizedBox(width: 50),
                GameButton(onPressed: () {}, asset: appleIc),
              ],
            ),
          )
        ],
      ),
    );
  }
}
