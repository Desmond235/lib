import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key, required this.addTX}) : super(key: key);

  final Function addTX;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

//  getting user input
  void _submitData() {
    if(_amountController.text.isEmpty){
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTX(enteredTitle, enteredAmount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null ) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                decoration: const InputDecoration(labelText: 'Item'),
                controller: _titleController,
                onSubmitted: (_) => _submitData()
                // onChanged: (value)=> titleInput = value,
                ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged:(value) => amountInput = value,
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'
                                   ),
                  ),
                 const SizedBox(width: 5,),
                  TextButton(
                    onPressed: _showDatePicker,
                    style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColor),
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor:
                      Theme.of(context).textTheme.labelLarge!.color,
                  padding: const EdgeInsets.all(15)),
              child: const Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
