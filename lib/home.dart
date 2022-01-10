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
        backgroundColor: Colors.amber,
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
                    elevation: 10,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffadaddd),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            event.price.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
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
                              event.time.toString(),
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
            )
          ],
        ),
      ),
    );
  }
}
