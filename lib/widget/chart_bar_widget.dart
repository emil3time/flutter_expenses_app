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
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 15,
                color: Colors.grey.shade300,
                child: FractionallySizedBox(
                  heightFactor: procOfTotalWeekAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(dayLabel),
          Text(dayAmount.toStringAsFixed(0)),
        ],
      ),
    ));
  }
}