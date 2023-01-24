part of 'slot_machine_bloc.dart';

abstract class SlotMachineEvent {
  const SlotMachineEvent();
}

class SpinMachineEvent extends SlotMachineEvent {
  final int bet;
  const SpinMachineEvent({required this.bet});
}
