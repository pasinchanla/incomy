// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:personal_finance/models/transaction.dart';

// Project imports:
import 'package:personal_finance/alertdialog.dart';
import 'dart:math';

// import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateFormat _dateTimeKey = DateFormat('yyyy-MM-dd');

  Map<String, List<Transaction>> _transactionList = {
    '2021-09-21': [
      Transaction(date: DateTime.now(), isIncome: true, price: 1000),
      Transaction(
          date: DateTime.now().add(Duration(hours: 2)),
          isIncome: true,
          price: 1000),
      Transaction(
          date: DateTime.now().subtract(Duration(hours: 3)),
          isIncome: false,
          price: 500),
      Transaction(date: DateTime.now(), isIncome: true, price: 200),
      Transaction(date: DateTime.now(), isIncome: false, price: 100),
    ],
  };

  String _dateTime() {
    DateFormat _dateFormatter = DateFormat.yMMMd('en_US');
    return _dateFormatter.format(DateTime.now());
  }

  Widget _showAlertDialog({required bool isIncome}) {
    return AlertDialog(
        title: isIncome
            ? Text('Input your new income')
            : Text('Input your new expense'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                if (isIncome) {
                  setState(() {
                    _transactionList.update(
                        _dateTimeKey.format(DateTime.now()),
                        (value) => value
                          ..add(Transaction(
                              date: DateTime.now(),
                              isIncome: true,
                              price: Random().nextInt(5000))));
                  });
                } else {
                  setState(() {
                    _transactionList.update(
                        _dateTimeKey.format(DateTime.now()),
                        (value) => value
                          ..add(Transaction(
                              date: DateTime.now(),
                              isIncome: false,
                              price: Random().nextInt(5000))));
                  });
                }
                Navigator.pop(context);
              },
              child: Text('OK'))
        ]);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Today is ' + _dateTime()),
      ),
      body: (_transactionList[_dateTimeKey.format(DateTime.now())] ?? [])
              .isEmpty
          ? Center(child: Text('Nothing today'))
          : ListView.separated(
              itemCount:
                  (_transactionList[_dateTimeKey.format(DateTime.now())] ?? [])
                      .length,
              itemBuilder: (context, i) {
                Transaction _todaysTransaction =
                    (_transactionList[_dateTimeKey.format(DateTime.now())] ??
                        [])[i];

                return ListTile(
                  title: Text(_todaysTransaction.isIncome
                      ? _todaysTransaction.price.toString()
                      : '-${_todaysTransaction.price.toString()}'),
                  tileColor:
                      (_transactionList[_dateTimeKey.format(DateTime.now())] ??
                                  [])[i]
                              .isIncome
                          ? Colors.green
                          : Colors.red,
                );
              },
              separatorBuilder: (_, __) {
                return Divider();
              },
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.money),
                        title: Text('Income'),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => _showAlertDialog(isIncome: true));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.money_off),
                        title: Text('Expense'),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) =>
                                  _showAlertDialog(isIncome: false));
                        },
                      ),
                    ],
                  );
                });
          }),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       automaticallyImplyLeading: false,
  //       title: Text('Today is ' + _dateTime()),
  //     ),
  //     body: ListView.separated(
  //         itemBuilder: (BuildContext context, int i) {
  //           return Container(
  //             child: Text('Row ${_rowList[i]}'),
  //             padding: EdgeInsets.all(16.0),
  //           );
  //         },
  //         separatorBuilder: (BuildContext context, int index) {
  //           return Divider();
  //         },
  //         itemCount: _rowList.length),
  //   );
  // }
}
