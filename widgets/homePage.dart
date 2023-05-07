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
  final List<Transaction> _userTransactions = [];

  bool _showChart = false;
  // getter for recent Transaction
  Iterable<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    });
  }

// Function for adding new transaction
  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

// modal bottom sheet
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(addTX: _addNewTransaction),
          );
        });
  }

  //deleting transactions
  void deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {

    //checking orientation of the app
    final isLnScape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text(
        'Personal expenses',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Colors.purple, Colors.red],
        )),
      ),
      // add icon to the appbar
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
          color: Colors.white,
        )
      ],
    );

    // txList
    final txList = Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                  0.7,
              child: TransactionList(
                transactions: _userTransactions,
                deleteTx: deleteTransaction,
              ),
            );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // landscape mode 
             if(isLnScape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show chart'),
                Switch(value: _showChart, onChanged:(value){
                  setState(() {
                    _showChart = value;
                  });
                } )
              ],
            ),
            const SizedBox(height: 5),

            // portrait mode
            if(!isLnScape) Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(recentTransactions: _recentTransactions.toList()
                )
              ),

              if(!isLnScape)txList,
            
           
            // landscape mode
            if (isLnScape)_showChart 
             // ignore: sized_box_for_whitespace
           ? Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                    0.7,
                child: Chart(recentTransactions: _recentTransactions.toList()
                )
              )
            // ignore: sized_box_for_whitespace
           : txList
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 5,
        child: const Icon(Icons.add),
      ),
    );
  }
}
