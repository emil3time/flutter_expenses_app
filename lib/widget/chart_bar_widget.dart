import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayLabel;
  final double dayAmount;
  double procOfTotalWeekAmount;

  ChartBar(
      {required this.dayLabel,
      required this.dayAmount,
      required this.procOfTotalWeekAmount});

  @override
  Widget build(BuildContext context) {
    return (Card(
      elevation: 20,
      color: Colors.blue,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                width: 15,
                color: Colors.grey.shade300,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: procOfTotalWeekAmount,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          FittedBox(
            child: Text(
              dayLabel,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          FittedBox(
              child: Text(
            dayAmount.toStringAsFixed(0),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          )),
        ],
      ),
    ));
  }
}
