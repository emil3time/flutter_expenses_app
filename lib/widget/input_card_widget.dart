import 'package:flutter/material.dart';

class InputCardWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
