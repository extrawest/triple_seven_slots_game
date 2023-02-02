import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triple_seven_slots_game/app.dart';
import 'package:triple_seven_slots_game/utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogger();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(App());
}
