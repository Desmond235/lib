import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransctions extends StatefulWidget {
  UserTransctions({Key? key}) : super(key: key);

  @override
  _UserTransctionsState createState() => _UserTransctionsState();
}

class _UserTransctionsState extends 
State<UserTransctions> {

   final List<Transaction> _userTransactions = [
    Transaction(
        id: 'd1', title: 'New Phone', amount: 70.00, date: DateTime.now()),
    Transaction(
        id: 'd2',
        title: 'Weekly Groceries',
        amount: 14.56,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount){
    final newTx = Transaction(
      id: DateTime.now().toString(),
       title: title,
        amount: amount,
         date: DateTime.now());

         setState(() {
           _userTransactions.add(newTx);
         });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
            NewTransaction(addTX: _addNewTransaction),
            TransactionList(transactions: _userTransactions
          ,)
        ],
    );
  }
}