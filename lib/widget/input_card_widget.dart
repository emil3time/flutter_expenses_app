import 'package:flutter/material.dart';

class InputCardWidget extends StatefulWidget {
  Function addNewEventA;
  InputCardWidget(this.addNewEventA);

  @override
  State<InputCardWidget> createState() => _InputCardWidgetState();
}

class _InputCardWidgetState extends State<InputCardWidget> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  void submitData() {
    final textInput = nameController.text;
    final amountInput = double.parse(priceController.text);

    if (textInput.isEmpty || textInput.length > 15 || amountInput <= 0) {
      return;
    }

    widget.addNewEventA(textInput, amountInput);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      submitData();
                    },
                    child: Text(
                      'add new event',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
