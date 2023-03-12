// ignore_for_file: file_names

import './transaction_list.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 'd1', 
    //     title: 'New Phone',
    //      amount: 70.00, 
    //      date: DateTime.now()),
    // Transaction(
    //     id: 'd2',
    //     title: 'Weekly Groceries',
    //     amount: 14.56,
    //     date: DateTime.now()),
  ];
  
  // getter for recent Transaction
  Iterable<Transaction> get  _recentTransactions{
    return _userTransactions.where((transaction){
      return transaction.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7)
      ));
    });
  }
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

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx , builder:(_){
      return GestureDetector(
        onTap: (){},
        behavior: HitTestBehavior.opaque ,
        child: NewTransaction(addTX: _addNewTransaction) ,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Personal expenses',style: TextStyle(fontSize: 20,color: Colors.white),),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 1,
          shadowColor: Theme.of(context).shadowColor,
          
          // add icon to the appbar
          actions: [
            IconButton(onPressed:  ()=>_startAddNewTransaction(context),
             icon:const Icon(Icons.add),
             color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5),
                // ignore: sized_box_for_whitespace
                Chart(recentTransactions:_recentTransactions.toList() ),
                TransactionList(transactions: _userTransactions)
              ],
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>_startAddNewTransaction(context),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          elevation: 5,
          child: const Icon(Icons.add),
        ),
     );
  }
}
