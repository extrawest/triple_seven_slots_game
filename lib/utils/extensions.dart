extension BalanceConvert on int {
  String cutBalance() {
    if (this < 1000) {
      final n = this / 1000;
      return '${n}k';
    } else {
      final n = this ~/ 1000;
      return '${n}k';
    }
  }
}
