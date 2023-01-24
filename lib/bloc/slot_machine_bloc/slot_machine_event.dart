abstract class SlotMachineEvent {
  const SlotMachineEvent();
}

class SpinMachineEvent extends SlotMachineEvent {
  final int bet;
  const SpinMachineEvent({required this.bet});
}
