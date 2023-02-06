// ignore_for_file: file_names

import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 'd1', title: 'New Phone', amount: 70.00, date: DateTime.now()),
    Transaction(
        id: 'd2',
        title: 'Weekly Groceries',
        amount: 14.56,
        date: DateTime.now()),
  ];
  MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text('CHART!'),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Tile'),
                    ),
                    TextField(decoration: InputDecoration(labelText: 'Amount'),),
                    TextButton(onPressed: (){},
                     child: Text('Add Transaction',style: TextStyle(color:Colors.purple),),),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$${tx.amount}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMd().format(tx.date),
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
