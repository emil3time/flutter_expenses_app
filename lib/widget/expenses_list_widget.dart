import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expenses_event_model.dart';

class ExpensesListWidget extends StatelessWidget {
  final List<ExpensesEventModel> eventsA;
  final Function deleteEventA;

  ExpensesListWidget({required this.eventsA, required this.deleteEventA});

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          width: 350,
          child: ListView.builder(
            itemCount: eventsA.length,
            itemBuilder: (_, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(15))),
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
                      child: FittedBox(
                        child: SizedBox(
                          height: 33,
                          width: 80,
                          child: Text(
                            eventsA[index].price.toStringAsFixed(2),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 162,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              eventsA[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  fontFamily: 'Quicksand'),
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMd().format(eventsA[index].time),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          deleteEventA(eventsA[index].id);
                        },
                        icon: Icon(Icons.clear))
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

// Card(
// color: Colors.amber.shade700,
// margin: EdgeInsets.symmetric(vertical: 7, horizontal: 2),
// elevation: 15,
// child: ListTile(
// leading: CircleAvatar(
// radius: 30,
// child: FittedBox(
// child: Padding(
// padding: EdgeInsets.all(10),
// child: Text(
// eventsA[index].price.toStringAsFixed(2),
// style: TextStyle(
// fontWeight: FontWeight.bold, fontSize: 20),
// ),
// ),
// ),
// ),
// title: Text(
// eventsA[index].name,
// style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// ),
// subtitle:
// Text(DateFormat.yMMMEd().format(eventsA[index].time)),
// ),
// );
