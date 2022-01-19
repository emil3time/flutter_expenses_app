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
    return LayoutBuilder(
      builder: (context, constraints) => (Card(
        elevation: 20,
        color: Colors.blue,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: constraints.maxHeight * 0.67,
                  width: constraints.maxWidth * 0.20,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(7), bottom: Radius.circular(7)),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: procOfTotalWeekAmount,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(7),
                              bottom: Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              // height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  dayLabel,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  dayAmount.toStringAsFixed(0),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
