import 'package:flutter/material.dart';
import './widget/expenses_list_widget.dart';
import './widget/input_card_widget.dart';
import 'model/expenses_event_model.dart';

class ExpensesManager extends StatefulWidget {
  @override
  _ExpensesManagerState createState() => _ExpensesManagerState();
}

class _ExpensesManagerState extends State<ExpensesManager> {
  List<ExpensesEventModel> events = [
    ExpensesEventModel(
      id: 36525463,
      price: 5,
      name: 'glass',
      time: DateTime.now(),
    ),
    ExpensesEventModel(
      id: 36525464,
      price: 30,
      name: 'liquer',
      time: DateTime.now(),
    ),
    ExpensesEventModel(
      id: 36525465,
      price: 7,
      name: 'coca-cola',
      time: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputCardWidget(),
        ExpensesListWidget(eventsA: events),
      ],
    );
  }
}
