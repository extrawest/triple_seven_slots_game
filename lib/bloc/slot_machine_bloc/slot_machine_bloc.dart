import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triple_seven_slots_game/consts.dart';
import 'package:triple_seven_slots_game/main.dart';
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
    final prizesIndexes = isTesting ? generateTestingPrize() : generatePrizes();

    final List<int> prize;
    final prizeRowIndex = _checkRows(prizesIndexes);
    bool isDiagonal = false;

    if (prizeRowIndex.isEmpty) {
      prize = _checkDiagonals(prizesIndexes);
      isDiagonal = true;
    } else {
      prize = [...prizeRowIndex];
    }

    if (prize.isNotEmpty) {
      emit(state.copyWith(
        prizeIndexes: prizesIndexes,
        winPrizeIndex: prize.last,
        winRow: prize.first,
        isDiagonal: isDiagonal,
        isSpinning: true,
        prize: SlotMachineRepository.prizes[prize.last],
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

  /// Return array, where first item
  /// in array - winning row index, and the second one is item index
  /// F.e.
  ///          [1, 2, 3]
  /// Input -->[1, 0, 7] last row(index==2) has two '4'
  ///          [4, 4, 5]
  ///
  /// Output --> [2, 4]
  /// If there is no matches, returns []
  List<int> _checkRows(List<List<int>> prizeIndexes) {
    for (int row = 0; row < prizeIndexes.length; row++) {
      final rowPrizeIndexes = prizeIndexes[row];
      if (rowPrizeIndexes[0] == jackpotIndex &&
          rowPrizeIndexes.every((element) => element == rowPrizeIndexes[0])) {
        return [row, rowPrizeIndexes[0]];
      }
      for (int i = 0; i < rowPrizeIndexes.length; i++) {
        for (int k = i + 1; k < rowPrizeIndexes.length; k++) {
          if (rowPrizeIndexes[i] != jackpotIndex && rowPrizeIndexes[i] == rowPrizeIndexes[k]) {
            return [row, rowPrizeIndexes[i]];
          }
        }
      }
    }
    return [];
  }

  /// Return array, where first item
  /// in array - winning diagonal index
  /// (starts from leftTop -> bottomRight one),
  /// and the second is item index
  /// F.e.
  ///          [1, 2, 3]
  /// Input -->[1, 0, 7]  leftTop -> bottomRight
  ///          [2, 4, 1]  diagonal has two '1'
  ///
  /// Output --> [0, 1]
  /// If there is no matches, returns []
  List<int> _checkDiagonals(List<List<int>> prizeIndexes) {
    final length = prizeIndexes.length - 1;
    bool isJackpot = true;
    for (int k = 0; k < length; k++) {
      if (prizeIndexes[k][k] != jackpotIndex) {
        isJackpot = false;
        for (int m = k + 1; m <= length; m++) {
          if (prizeIndexes[k][k] == prizeIndexes[m][m]) {
            return [0, prizeIndexes[m][m]];
          }
        }
      }
    }
    if (isJackpot) {
      return [0, jackpotIndex];
    }
    isJackpot = true;
    for (int k = length; k > 0; k--) {
      if (prizeIndexes[length - k][k] != 0) {
        isJackpot = false;
        for (int m = k - 1; m >= 0; m--) {
          if (prizeIndexes[length - k][k] == prizeIndexes[length - m][m]) {
            return [1, prizeIndexes[length - m][m]];
          }
        }
      }
    }
    if (isJackpot) {
      return [1, jackpotIndex];
    }
    return [];
  }

  List<List<int>> generateTestingPrize() {
    return List<List<int>>.generate(
      numberOfSlots,
      (_) => List<int>.generate(numberOfItemsInSlot, (_) => mockSlotMachinePrizeIndex),
    );
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
