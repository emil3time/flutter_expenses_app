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

  DateTime startUserDate = DateTime.utc(1994);
  DateTime currebtDate = DateTime.now();

  void submitData() {
    if (priceController.text.isEmpty) {
      return;
    }
    final textInput = nameController.text;
    final amountInput = double.parse(priceController.text);

    if (textInput.isEmpty ||
        amountInput <= 0 ||
        startUserDate == DateTime.utc(1994)) {
      return;
    }

    widget.addNewEventA(textInput, amountInput, startUserDate);
    Navigator.of(context).pop();
  }

  Future<void> startSelectData(BuildContext context) async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: currebtDate,
      firstDate: currebtDate.subtract(Duration(days: 7)),
      lastDate: currebtDate,
    );
    if (picker != null && picker != startUserDate) {
      setState(() {
        startUserDate = picker;
        print(startUserDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final queryHeight = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(222, 10))),
      elevation: 10,
      child: SizedBox(
        height: queryHeight * 0.55,
        child: Column(
          children: [
            SizedBox(
              height: queryHeight * 0.05,
            ),
            SizedBox(
              height: queryHeight * 0.1,
              child: TextField(
                onSubmitted: (_) => submitData(),
                style: TextStyle(fontSize: 22),
                keyboardType: TextInputType.text,
                maxLength: 15,
                controller: nameController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '   expense  ',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: queryHeight * 0.1,
              child: TextField(
                onSubmitted: (_) => submitData(),
                style: TextStyle(fontSize: 22),
                keyboardType: TextInputType.number,
                controller: priceController,
                maxLength: 6,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '   amount (PLN)',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: queryHeight * 0.12,
              child: Container(
                margin: EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      startUserDate == DateTime.utc(1994)
                          ? 'no date selected!'
                          : DateFormat.yMd().format(startUserDate),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            ),
            SizedBox(
              height: queryHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                    ),
                    onPressed: () {
                      submitData();
                    },
                    child: Text(
                      'add new event',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
