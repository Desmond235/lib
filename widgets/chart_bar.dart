import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {Key? key,
      required this.label,
      required this.amountPer,
      required this.amountSpent})
      : super(key: key);
  final String label;
  final double amountSpent;
  final double amountPer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: 20,
          child: FittedBox(child: Text('\$${amountSpent.toStringAsFixed(0)}'))
          ),
        const SizedBox(
          height: 5,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(15)),
              ),
              FractionallySizedBox(
                heightFactor: amountPer,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
