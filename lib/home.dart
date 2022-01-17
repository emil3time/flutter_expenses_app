import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/widget/chart_widget.dart';

import './widget/input_card_widget.dart';
import './widget/expenses_list_widget.dart';
import './model/expenses_event_model.dart';

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<ExpensesEventModel> _events = [];

  List<ExpensesEventModel> get _lastWeekTransactions {
    return _events.where((element) {
      return element.time.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewEvent(String newName, double newPrice, DateTime userDate) {
    final newEvent = ExpensesEventModel(
      id: DateTime.now().toString(),
      price: newPrice,
      name: newName,
      time: userDate,
    );
    setState(() {
      _events.add(newEvent);
    });
  }

  void _deleteEvent(String id) {
    setState(() {
      _events.removeWhere((e) => e.id == id);
    });
  }

  startAddNewEvent(parentContext) {
    showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        backgroundColor: Colors.transparent,
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
                Chart(lastWeekTransactionsA: _lastWeekTransactions),
                SizedBox(
                  height: 20,
                ),
                ExpensesListWidget(
                  eventsA: _events,
                  deleteEventA: _deleteEvent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
