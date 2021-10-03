import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../boxes.dart';
import '../constants/date.dart';
import '../model/transaction.dart';
import '../widget/transaction_dialog.dart';
import 'package:intl/intl.dart';

class IncomyTransactionPage extends StatefulWidget {
  const IncomyTransactionPage({Key? key}) : super(key: key);
  static const String route = '/transactions';

  @override
  _IncomyTransactionPageState createState() => _IncomyTransactionPageState();
}

class _IncomyTransactionPageState extends State<IncomyTransactionPage> {

  String _dateTime() {
    DateFormat _dateFormatter = DateFormat.yMMMd('en_US');
    return _dateFormatter.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
      return ValueListenableBuilder<Box<Transaction>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context, box, _) {
          final transactions = box.values.toList().cast<Transaction>();

          return buildContent(transactions);
        },
      );
  }

  Widget buildMOTD() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 60, bottom: 25, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today is ' + _dateTime(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  return SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Text(days[index]['label'],
                            style: const TextStyle(fontSize: 10)),
                        const SizedBox(height: 10),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.amber[800],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(days[index]['day'],
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }

  Widget buildContent(List<Transaction> transactions) {
    if (transactions.isEmpty) {
      return Column(
        children: [
          buildMOTD(),
          const SizedBox(
            child: Text(
              'No expenses yet!',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      );
    } else {
      final netExpense = transactions.fold<double>(
        0,
        (previousValue, transaction) => transaction.isExpense
            ? previousValue - transaction.amount
            : previousValue + transaction.amount,
      );
      final newExpenseString = '\$${netExpense.toStringAsFixed(2)}';
      final color = netExpense > 0 ? Colors.green : Colors.red;

      return Column(
        children: [
          buildMOTD(),
          const SizedBox(height: 24),
          Text(
            'Total: $newExpenseString',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: color,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = transactions[index];

                return buildTransaction(context, transaction);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildTransaction(
    BuildContext context,
    Transaction transaction,
  ) {
    final color = transaction.isExpense ? Colors.red : Colors.green;
    final date = DateFormat.yMMMd().format(transaction.createdDate);
    final amount = '\$' + transaction.amount.toStringAsFixed(2);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.name,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: [
          buildButtons(context, transaction),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context, Transaction transaction) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: const Text('Edit'),
              icon: const Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionDialog(
                    transaction: transaction,
                    onClickedDone: (name, amount, isExpense) =>
                        editTransaction(transaction, name, amount, isExpense),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: const Text('Delete'),
              icon: const Icon(Icons.delete),
              onPressed: () => deleteTransaction(transaction),
            ),
          )
        ],
      );
}
