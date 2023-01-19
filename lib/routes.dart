import 'package:flutter/cupertino.dart';
import 'package:triple_seven_slots_game/screens/main_menu_screen.dart';

const mainMenuScreen = 'main_menu_screen';

final Map<String, Widget Function(BuildContext)> routes = {
  mainMenuScreen: (context) => const MainMenuScreen(),
};
