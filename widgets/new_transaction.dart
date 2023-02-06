import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
   NewTransaction({Key? key,required this.addTX}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTX;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value)=> titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged:(value) => amountInput = value,
            ),
            TextButton(
              onPressed:addTX(titleController.text,double.parse(amountController.text)),
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
