import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_event.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_state.dart';
import 'package:triple_seven_slots_game/models/slot_machine_status.dart';

class SlotMachineBloc extends Bloc<SlotMachineEvent, SlotMachineState> {
  SlotMachineBloc() : super(const SlotMachineState()) {
    on<SpinMachineEvent>(_onSpinMachineEvent);
  }

  void _onSpinMachineEvent(SpinMachineEvent event, Emitter<SlotMachineState> emit) {
    emit(state.copyWith(slotMachineStatus: SlotMachineStatus.loading));
    final prizeIndex = generatePrizeIndex();
    // withdraw coins from the balance
    // start spinning
  }

  int? generatePrizeIndex() {
    final prizeIndexes = List<int>.generate(3, (_) => Random().nextInt(3));

    for (int i = 0; i < prizeIndexes.length; i++) {
      for (int k = i + 1; k < prizeIndexes.length; k++) {
        if (prizeIndexes[i] == prizeIndexes[k]) {
          return prizeIndexes[i];
        }
      }
    }
    return null;
  }
}
