import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triple_seven_slots_game/app.dart';
import 'package:triple_seven_slots_game/utils/logger.dart';

const isTestingEnvKey = 'IS_TESTING';
const mockSlotMachineValuesEnvKey = 'MOCK_SLOT_MACHINE_PRIZE_INDEX';

bool isTesting = false;
int mockSlotMachinePrizeIndex = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isTesting = const bool.fromEnvironment(isTestingEnvKey, defaultValue: false);
  if (isTesting) {
    mockSlotMachinePrizeIndex =
        const int.fromEnvironment(mockSlotMachineValuesEnvKey, defaultValue: 0);
  }
  setupLogger();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(App());
}
