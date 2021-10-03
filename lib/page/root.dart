// import 'package:flutter/material.dart';
// import 'package:personal_finance/constants/colors.dart';
// import 'package:personal_finance/page/stats_page.dart';
// import 'package:personal_finance/page/transaction_page.dart';
// import 'package:personal_finance/widget/transaction_dialog.dart';

// class IncomyRootPage extends StatefulWidget {
//   const IncomyRootPage({Key? key}) : super(key: key);
//   static const String route = '/root';

//   @override
//   _IncomyRootPageState createState() => _IncomyRootPageState();
// }

// class _IncomyRootPageState extends State<IncomyRootPage> {
//   int _selectedIndex = 0;
//   final List<Widget> _pageIndex = [const IncomyRootPage(), const IncomyTransactionPage(), const IncomyStatsPage()];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pageIndex[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             label: 'Transactions',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.auto_graph),
//             label: 'Stats',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: secondaryColor,
//         onTap: _onItemTapped,
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryColor,
//         child: const Icon(Icons.add),
//         onPressed: () => showDialog(
//           context: context,
//           builder: (context) => const TransactionDialog(
//             onClickedDone: addTransaction,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
