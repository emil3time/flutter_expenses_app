import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.blue,
                child: Text('Week Statistic'),
              ),
              Card(
                elevation: 10,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'expenses name'),
                    ),
                    TextField(
                      controller: priceController,
                      decoration: InputDecoration(labelText: 'price (PLN)'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              print(priceController.text);
                            },
                            child: Text('add new event')),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ...events.map(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
