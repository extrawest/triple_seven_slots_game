enum SlotMachineStatus { initial, loading, rolling, stopped }

extension SlotMachineStatusExt on SlotMachineStatus {
  bool get isInitial => this == SlotMachineStatus.initial;
  bool get isLoading => this == SlotMachineStatus.loading;
  bool get isRolling => this == SlotMachineStatus.rolling;
  bool get isStopped => this == SlotMachineStatus.stopped;
}

enum BalanceStatus { initial, loading, loaded, error }

extension BalanceStatusExt on BalanceStatus {
  bool get isInitial => this == BalanceStatus.initial;
  bool get isLoading => this == BalanceStatus.loading;
  bool get isLoaded => this == BalanceStatus.loaded;
  bool get isError => this == BalanceStatus.error;
}
