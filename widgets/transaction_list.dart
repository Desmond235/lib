import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 500,
      child: transactions.isEmpty  ? 
      Column(children: [
        Text('No transactions added yet!', style: Theme.of(context).textTheme.titleSmall, ),
        const SizedBox(height: 10),
        // ignore: sized_box_for_whitespace
        Container(
          height: 200,
          child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
      ],)
      : ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            elevation: 3,
            child: Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all( 
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleSmall
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
