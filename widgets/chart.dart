import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransactions});
  final List<Transaction> recentTransactions;

  // getter for transactions
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmount = 0.0;

      // looping through weekDays to calculate for the  total amount
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalAmount
      };
    });
  }

  //  spending percent
  double get totalSpending {
    return groupedTransactions.fold<double>(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding:const EdgeInsets.all(10) ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((element) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: element['day'].toString(),
                  amountPer: totalSpending == 0.0
                      ? 0.0
                      : (element['amount'] as double) / totalSpending,
                  amountSpent: element['amount'] as double),
            );
          }).toList(),
        ),
      ),
    );
  }
}
