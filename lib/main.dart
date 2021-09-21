// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:personal_finance/constants/colors.dart';
import 'package:personal_finance/homepage.dart';
import 'package:personal_finance/models/transaction.dart';

void main() async {
  runApp(IncomyApp());
}

class IncomyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: secondaryColor,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
