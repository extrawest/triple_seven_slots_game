enum SlotMachineStatus { initial, loading, rolling, stopped }

extension SlotMachineStatusExt on SlotMachineStatus {
  bool get isInitial => this == SlotMachineStatus.initial;
  bool get isLoading => this == SlotMachineStatus.loading;
  bool get isRolling => this == SlotMachineStatus.rolling;
  bool get isStopped => this == SlotMachineStatus.stopped;
}
