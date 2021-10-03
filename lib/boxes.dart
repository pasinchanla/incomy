// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import '../model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transactions');
}
