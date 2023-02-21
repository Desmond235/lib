import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
 const NewTransaction({Key? key, required this.addTX}) : super(key: key);

  final Function addTX;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
     
     if(enteredTitle.isEmpty || enteredAmount <=0){
      return;
     }
   
    widget.addTX(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const  InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData()
              // onChanged: (value)=> titleInput = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged:(value) => amountInput = value,
            ),
            TextButton(
              onPressed: submitData,
              child:const Text(
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
