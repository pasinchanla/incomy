// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fl_chart/fl_chart.dart';

// Project imports:
import '../constants/colors.dart';
import '../constants/date.dart';
import '../widget/chart.dart';

// Project imports:

class IncomyStatsPage extends StatefulWidget {
  static const String route = '/stat';

  const IncomyStatsPage({Key? key}) : super(key: key);
  @override
  _IncomyStatsPageState createState() => _IncomyStatsPageState();
}

class _IncomyStatsPageState extends State<IncomyStatsPage> {
  int activeDay = 3;

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": Colors.blue,
        "label": "Income",
        "cost": "\$6593.75"
      },
      {
        "icon": Icons.arrow_forward,
        "color": Colors.red,
        "label": "Expense",
        "cost": "\$2645.50"
      }
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Stats",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(months.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width - 40) / 6,
                            child: Column(
                              children: [
                                Text(
                                  months[index]['label'],
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: activeDay == index
                                          ? primaryMaterial
                                          : Colors.black.withOpacity(0.02),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: activeDay == index
                                              ? primaryMaterial
                                              : Colors.black.withOpacity(0.1))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 7, bottom: 7),
                                    child: Text(
                                      months[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: activeDay == index
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Net balance",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Color(0xff67727d)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$2446.90",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: (size.width - 20),
                        height: 150,
                        child: LineChart(
                          mainData(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                  width: (size.width - 60) / 2,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: expenses[index]['color']),
                          child: Center(
                              child: Icon(
                            expenses[index]['icon'],
                            color: Colors.white,
                          )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses[index]['label'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              expenses[index]['cost'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
