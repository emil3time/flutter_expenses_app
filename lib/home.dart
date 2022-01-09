import 'package:flutter/material.dart';
import 'expensesEvent.dart';

class HomeApp extends StatelessWidget {
  List<ExpensesEvent> events = [
    ExpensesEvent(
      id: 36525463,
      price: 5,
      name: 'glass',
      time: DateTime.now(),
    ),
    ExpensesEvent(
      id: 36525464,
      price: 30,
      name: 'liquer',
      time: DateTime.now(),
    ),
    ExpensesEvent(
      id: 36525465,
      price: 7,
      name: 'coca-cola',
      time: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.blue,
              child: Text('Week Statistic'),
            ),
            Column(
              children: [
                ...events.map(
                  (event) => Card(
                    child: Row(
                      children: [
                        Container(child: Text(event.price.toString())),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(event.name),
                            Text(event.time.toString()),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
