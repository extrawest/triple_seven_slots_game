import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/models/prize.dart';
import 'package:triple_seven_slots_game/models/slot_machine_status.dart';
import 'package:triple_seven_slots_game/repositories/slot_machine_repository.dart';

part 'slot_machine_event.dart';
part 'slot_machine_state.dart';

class SlotMachineBloc extends Bloc<SlotMachineEvent, SlotMachineState> {
  SlotMachineBloc() : super(const SlotMachineState()) {
    on<SpinMachineEvent>(_onSpinMachineEvent);
    on<IncreaseBet>(_onIncreaseBet);
    on<DecreaseBet>(_onDecreaseBet);
    on<StopMachine>(_onStopMachine);
  }

  void _onSpinMachineEvent(SpinMachineEvent event, Emitter<SlotMachineState> emit) {
    emit(state.copyWith(slotMachineStatus: SlotMachineStatus.loading));
    final prizesIndexes = generatePrizes();
    final prizeIndex = generatePrizeIndex(prizesIndexes);

    if (prizeIndex != null) {
      emit(state.copyWith(
        prizeIndexes: prizesIndexes,
        winPrizeIndex: prizeIndex,
        isSpinning: true,
        prize: SlotMachineRepository.prizes[prizeIndex],
      ));
    } else {
      emit(state.copyWith(
          prizeIndexes: prizesIndexes, isSpinning: true, prize: null, keepPrize: false));
    }
  }

  void _onStopMachine(StopMachine event, Emitter<SlotMachineState> emit) {
    emit(state.copyWith(isSpinning: false));
  }

  List<int> generatePrizes() {
    return List<int>.generate(
        numberOfSlots, (_) => Random().nextInt(SlotMachineRepository.prizes.length));
  }

  int? generatePrizeIndex(List<int> prizeIndexes) {
    for (int i = 0; i < prizeIndexes.length; i++) {
      for (int k = i + 1; k < prizeIndexes.length; k++) {
        if (prizeIndexes[i] == prizeIndexes[k]) {
          return prizeIndexes[i];
        }
      }
    }
    return null;
  }

  void _onIncreaseBet(IncreaseBet event, Emitter<SlotMachineState> emit) {
    if (state.currentBet < 20000) {
      emit(state.copyWith(
          currentBet: state.currentBet + differenceBet, previousBet: state.currentBet));
    }
  }

  void _onDecreaseBet(DecreaseBet event, Emitter<SlotMachineState> emit) {
    if (state.currentBet > 1000) {
      emit(state.copyWith(
          currentBet: state.currentBet - differenceBet, previousBet: state.currentBet));
    }
  }
}
