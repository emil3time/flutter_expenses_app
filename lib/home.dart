import 'package:flutter/material.dart';

import './widget/input_card_widget.dart';
import './widget/expenses_list_widget.dart';
import './model/expenses_event_model.dart';

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
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

  startAddNewEvent(parentContext) {
    showModalBottomSheet(
        context: (parentContext),
        builder: (contextMBS) {
          return InputCardWidget(_addNewEvent);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            startAddNewEvent(context);
          },
          elevation: 10,
          child: Icon(
            Icons.add,
            size: 45,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                startAddNewEvent(context);
              },
            )
          ],
          title: Text('expenses'),
        ),
        backgroundColor: Colors.amber,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.blue,
                  child: Text('Week Statistic'),
                ),
                ExpensesListWidget(eventsA: _events),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
