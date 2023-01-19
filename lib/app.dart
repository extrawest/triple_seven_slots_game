import 'package:flutter/material.dart';
import 'package:triple_seven_slots_game/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triple Seven Slots Game',
      routes: routes,
      initialRoute: mainMenuScreen,
    );
  }
}
