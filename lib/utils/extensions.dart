extension BalanceConvert on int {
  String cutBalance() {
    final n = this ~/ 1000;
    return '${n}k';
  }
}
