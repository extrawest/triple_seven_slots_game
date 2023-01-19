import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/widgets/common/background_gradient_scaffold.dart';
import 'package:triple_seven_slots_game/widgets/main_menu_screen/coinsSection.dart';
import 'package:triple_seven_slots_game/widgets/main_menu_screen/game_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CoinsSection(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameButton(onPressed: () {}, asset: seventhIc),
                const SizedBox(height: 50),
                GameButton(onPressed: () {}, asset: appleIc),
              ],
            ),
          )
        ],
      ),
    );
  }
}
