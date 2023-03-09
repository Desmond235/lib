import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransactions});
  final List<Transaction> recentTransactions;  

  // getter for transactions
  List <Map<String, Object>> get groupedTransactions{
     return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmount = 0.0;

      // looping through weekDays to calculate for the  total amount 
      for (var i = 0; i < recentTransactions.length; i++) {
        if(recentTransactions[i].date.day == weekDay.day &&  recentTransactions[i].date.month == weekDay.month && recentTransactions[i].date.year == weekDay.year ){
          totalAmount += recentTransactions[i].amount; 
        }
      }
      return {
        'day' : DateFormat.E(weekDay), 
        'amount' : totalAmount
        };
     });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [

        ],
      )
      ,
    );
  }
}
