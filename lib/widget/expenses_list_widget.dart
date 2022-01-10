import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expenses_event_model.dart';

class ExpensesListWidget extends StatelessWidget {
  List<ExpensesEventModel> eventsA;

  ExpensesListWidget({required this.eventsA});

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          child: ListView.builder(
            itemCount: eventsA.length,
            itemBuilder: (_, index) {
              return Card(
                elevation: 15,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        eventsA[index].price.toStringAsFixed(2),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
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
                          eventsA[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMMEEEEd().format(eventsA[index].time),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
