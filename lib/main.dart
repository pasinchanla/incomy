// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import '../model/transaction.dart';
import '../page/stats_page.dart';
import '../page/transaction_page.dart';
import '../page/root.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  runApp(const IncomyApp());
}

class IncomyApp extends StatelessWidget {
  const IncomyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: '/transactions',
      routes: {
        // IncomyRootPage.route: (context) => const IncomyRootPage(),
        IncomyTransactionPage.route: (context) => const IncomyTransactionPage(),
        IncomyStatsPage.route: (context) => const IncomyStatsPage(),
      },
      // home: IncomyRootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
