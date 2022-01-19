import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/expenses_event_model.dart';

class ExpensesListWidget extends StatelessWidget {
  final List<ExpensesEventModel> eventsA;
  final Function deleteEventA;

  ExpensesListWidget({required this.eventsA, required this.deleteEventA});

  @override
  Widget build(BuildContext context) {
    // You work only on inherited parent size properties not on whole screen like MQ
    return LayoutBuilder(
        builder: (context, constraints) => Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 1,
                  child: eventsA.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                                height: constraints.maxHeight * 0.8,
                                child: Image.asset('assets/images/money.png')),
                            SizedBox(
                              height: constraints.maxHeight * 0.04,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.1,
                              child: FittedBox(
                                child: Text(
                                  'Your list is empty - start counting!',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      : ListView.builder(
                          itemCount: eventsA.length,
                          itemBuilder: (_, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(15))),
                              elevation: 15,
                              child: Row(
                                children: [
                                  Container(
                                    width: constraints.maxWidth * 0.16,
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
                                    child: SizedBox(
                                      height: constraints.maxHeight * 0.12,
                                      width: constraints.maxWidth * 0.2,
                                      child: FittedBox(
                                        child: Text(
                                          eventsA[index]
                                              .price
                                              .toStringAsFixed(2),
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
                                    width: constraints.maxWidth * 0.03,
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.57,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * 0.12,
                                          child: FittedBox(
                                            child: Text(
                                              eventsA[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24,
                                                  fontFamily: 'Quicksand'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * 0.05,
                                          child: FittedBox(
                                            child: Text(
                                              DateFormat.yMMMMd()
                                                  .format(eventsA[index].time),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.01,
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
            ));
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
