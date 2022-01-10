import 'package:flutter/material.dart';
import './widget/expenses_list_widget.dart';
import './widget/input_card_widget.dart';
import '../model/expenses_event_model.dart';

class ExpensesManager extends StatefulWidget {
  @override
  _ExpensesManagerState createState() => _ExpensesManagerState();
}

class _ExpensesManagerState extends State<ExpensesManager> {
  List<ExpensesEventModel> _events = [
    ExpensesEventModel(
      id: DateTime.now(),
      price: 5,
      name: 'glass',
      time: DateTime.now(),
    ),
    ExpensesEventModel(
      id: DateTime.now(),
      price: 77.7,
      name: 'liquer',
      time: DateTime.now(),
    ),
    ExpensesEventModel(
      id: DateTime.now(),
      price: 233.33,
      name: 'coca-cola',
      time: DateTime.now(),
    ),
  ];

  void _addNewEvent(String newName, double newPrice) {
    final newEvent = ExpensesEventModel(
      id: DateTime.now(),
      price: newPrice,
      name: newName,
      time: DateTime.now(),
    );
    setState(() {
      _events.add(newEvent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputCardWidget(_addNewEvent),
        ExpensesListWidget(eventsA: _events),
      ],
    );
  }
}
