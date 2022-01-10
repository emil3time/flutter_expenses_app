import 'package:flutter/material.dart';
import 'package:flutter_expenses_app/expenses_manager.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                ExpensesManager(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
