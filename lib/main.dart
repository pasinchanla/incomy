// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import '../model/transaction.dart';
import 'page/root_page.dart';

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
      home: IncomyRootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
