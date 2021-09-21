class Transaction {
  final DateTime date;

  /// true = income, false = expense
  final bool isIncome;

  /// Price of the income or expense
  final int price;

  Transaction({
    required this.date,
    required this.isIncome,
    required this.price
  });
}
