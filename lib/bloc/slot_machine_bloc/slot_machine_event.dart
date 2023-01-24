part of 'slot_machine_bloc.dart';

abstract class SlotMachineEvent {
  const SlotMachineEvent();
}

class SpinMachineEvent extends SlotMachineEvent {
  final int bet;
  const SpinMachineEvent({required this.bet});
}

class StopMachine extends SlotMachineEvent {
  const StopMachine();
}

class IncreaseBet extends SlotMachineEvent {
  const IncreaseBet();
}

class DecreaseBet extends SlotMachineEvent {
  const DecreaseBet();
}

class FetchUserBalance extends SlotMachineEvent {
  const FetchUserBalance();
}

class UpdateUserBalance extends SlotMachineEvent {
  final int balanceChange;
  const UpdateUserBalance(this.balanceChange);
}
