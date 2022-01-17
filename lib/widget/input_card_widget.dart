import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputCardWidget extends StatefulWidget {
  Function addNewEventA;

  InputCardWidget(this.addNewEventA);

  @override
  State<InputCardWidget> createState() => _InputCardWidgetState();
}

class _InputCardWidgetState extends State<InputCardWidget> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  DateTime startUserDate = DateTime.now();

  void submitData() {
    if (priceController.text.isEmpty) {
      return;
    }
    final textInput = nameController.text;
    final amountInput = double.parse(priceController.text);

    if (textInput.isEmpty ||
        textInput.length > 15 ||
        amountInput <= 0 ||
        startUserDate == DateTime.now()) {
      return;
    }

    widget.addNewEventA(textInput, amountInput, startUserDate);
    Navigator.of(context).pop();
  }

  Future<void> startSelectData(BuildContext context) async {
    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: startUserDate,
        firstDate: DateTime(2022, 1, 1),
        lastDate: DateTime(2050));
    if (picker != null && picker != startUserDate) {
      setState(() {
        startUserDate = picker;
        print(startUserDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(222, 10))),
      elevation: 10,
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            TextField(
              onSubmitted: (_) => submitData(),
              style: TextStyle(fontSize: 22),
              keyboardType: TextInputType.text,
              controller: nameController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '   expense  ',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  )),
            ),
            TextField(
              onSubmitted: (_) => submitData(),
              style: TextStyle(fontSize: 22),
              keyboardType: TextInputType.number,
              controller: priceController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '   amount (PLN)',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    startUserDate == DateTime.now()
                        ? 'no data choosen yet!'
                        : DateFormat.yMd().format(startUserDate),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          startSelectData(context);
                        });
                      },
                      child: Text(
                        'pick data',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        submitData();
                      },
                      child: Text(
                        'add new event',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
