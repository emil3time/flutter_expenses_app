import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/widget/chart_bar_widget.dart';
import 'package:intl/intl.dart';
import '../model/expenses_event_model.dart';

class Chart extends StatelessWidget {
  List<ExpensesEventModel> lastWeekTransactionsA;
  Chart({required this.lastWeekTransactionsA});

  List<Map<String, Object>> get allWeekTransactions {
    return List.generate(7, (index) {
      final lastDayTransactions = DateTime.now().subtract(
        Duration(days: index),
      );
      var allDayAmount = 0.0;

      for (var i = 0; i < lastWeekTransactionsA.length; i++) {
        if (lastWeekTransactionsA[i].time.day == lastDayTransactions.day &&
            lastWeekTransactionsA[i].time.month == lastDayTransactions.month &&
            lastWeekTransactionsA[i].time.year == lastDayTransactions.year) {
          allDayAmount += lastWeekTransactionsA[i].price;
        }
      }

      return {
        'day': DateFormat.E().format(lastDayTransactions),
        'amount': allDayAmount
      };
    }).toList();
  }

  double get totalMoneySpend {
    return allWeekTransactions.fold(0.0, (sum, item) {
      return (sum + (item['amount'] as double));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        color: Colors.blue,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...allWeekTransactions
                .map((e) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          dayLabel: (e['day'] as String),
                          dayAmount: (e['amount'] as double),
                          procOfTotalWeekAmount: totalMoneySpend == 0.0
                              ? 0.0
                              : (e['amount'] as double) / totalMoneySpend),
                    ))
                .toList()
                .reversed
          ],
        ),
      ),
    );
  }
}
// ...allWeekTransactions
//     .map((e) => Stack(children: [
// Container(
// child: Column(
// children: [
// Text((e['day'] as String)),
// Text((e['amount'] as String))
// ],
// ),
// ),
// ]))
// .toList()
