import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triple_seven_slots_game/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(const App());
}
