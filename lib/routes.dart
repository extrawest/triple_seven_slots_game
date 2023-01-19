import 'package:flutter/cupertino.dart';
import 'package:triple_seven_slots_game/screens/777_slots_screen.dart';
import 'package:triple_seven_slots_game/screens/main_menu_screen.dart';

const mainMenuScreenRoute = 'main_menu_screen_route';
const sevenSlotsScreenRoute = 'seven_slots_screen_route';

final Map<String, Widget Function(BuildContext)> routes = {
  mainMenuScreenRoute: (context) => const MainMenuScreen(),
  sevenSlotsScreenRoute: (context) => const SevenSlotsScreen(),
};
