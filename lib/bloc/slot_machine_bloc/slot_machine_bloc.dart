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
    final prizesIndexes = [
      [0, 1, 0],
      [1, 2, 2],
      [4, 2, 1]
    ]; //generatePrizes();
    final prizeRow = generatePrizeIndex(prizesIndexes);

    if (prizeRow != null) {
      final int prizeIndex;
      if (prizesIndexes[prizeRow][0] != jackpotIndex) {
        prizeIndex = getPrizeIndex(prizesIndexes[prizeRow])!;
      } else {
        prizeIndex = prizesIndexes[prizeRow][0];
      }
      emit(state.copyWith(
        prizeIndexes: prizesIndexes,
        winPrizeIndex: prizeIndex,
        winRow: prizeRow,
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

  List<List<int>> generatePrizes() {
    return List<List<int>>.generate(
      numberOfSlots,
      (_) => List<int>.generate(
          numberOfItemsInSlot, (_) => Random().nextInt(SlotMachineRepository.prizes.length)),
    );
  }

  int? generatePrizeIndex(List<List<int>> prizeIndexes) {
    for (int row = 0; row < prizeIndexes.length; row++) {
      final rowPrizeIndexes = prizeIndexes[row];
      if (rowPrizeIndexes[0] == jackpotIndex &&
          rowPrizeIndexes.every((element) => element == rowPrizeIndexes[0])) {
        return row;
      }
      for (int i = 0; i < rowPrizeIndexes.length; i++) {
        for (int k = i + 1; k < rowPrizeIndexes.length; k++) {
          if (rowPrizeIndexes[i] != jackpotIndex && rowPrizeIndexes[i] == rowPrizeIndexes[k]) {
            return row;
          }
        }
      }
    }
    return null;
  }

  int? getPrizeIndex(List<int> prizeRow) {
    for (int i = 0; i < prizeRow.length; i++) {
      for (int k = i + 1; k < prizeRow.length; k++) {
        if (prizeRow[i] == prizeRow[k]) {
          return prizeRow[k];
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
