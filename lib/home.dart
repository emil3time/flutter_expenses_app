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
  bool showChart = false;

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
        // true all keyboard is above | false keyboard partially visible but scrollable
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (parentContext),
        builder: (contextMBS) {
          return SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                    // corresponds to the top of keyboards
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: InputCardWidget(_addNewEvent)));
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            startAddNewEvent(context);
          },
        )
      ],
      title: Text('expenses'),
    );

    final landscapeMode =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final sharedByOrientationExpensesList = SizedBox(
      //screen height - app bar height - system bar icons = actual working height area
      height: (MediaQuery.of(context).size.height * 0.6) -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top,
      child: ExpensesListWidget(
        eventsA: _events,
        deleteEventA: _deleteEvent,
      ),
    );
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
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
        //  appBar in final variable to minus  appBar.preferredSize.height from MediaQuery
        appBar: appBar,
        backgroundColor: Colors.amber,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // different content depend of MediaQuery.of(context).orientation == Orientation.landscape;
                  if (landscapeMode)
                    Switch(
                        value: showChart,
                        onChanged: (val) {
                          setState(() {
                            showChart = val;
                          });
                        }),
                  if (landscapeMode)
                    showChart
                        ? SizedBox(
                            height:

                                //screen height - app bar height - system bar icons = actual working height area
                                (MediaQuery.of(context).size.height * 0.73) -
                                    appBar.preferredSize.height -
                                    MediaQuery.of(context).padding.top,
                            child: Chart(
                                lastWeekTransactionsA: _lastWeekTransactions))
                        : sharedByOrientationExpensesList,
                  if (!landscapeMode)
                    // different height for portrait mode
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.37) -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top,
                        child: Chart(
                            lastWeekTransactionsA: _lastWeekTransactions)),
                  if (!landscapeMode) sharedByOrientationExpensesList
                ]),
          ),
        ),
      ),
    );
  }
}
