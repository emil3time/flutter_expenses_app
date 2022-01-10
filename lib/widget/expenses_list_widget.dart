import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expenses_event_model.dart';

class ExpensesListWidget extends StatelessWidget {
  List<ExpensesEventModel> eventsA;

  ExpensesListWidget({required this.eventsA});

  Widget build(BuildContext context) {
    return Column(
      children: [
        ...eventsA.map(
          (event) => Card(
            elevation: 15,
            child: Row(
              children: [
                Container(
                  width: 60,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    event.price.toString(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(event.time),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
