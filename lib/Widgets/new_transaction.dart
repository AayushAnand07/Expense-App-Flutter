import 'package:expense_app/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  DateTime _SelectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _SelectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
     enteredAmount,
      _SelectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _SelectedDate = pickedDate;
      });
    });
    print(" ... ");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
            //   color: backgroundColor,
            // borderRadius: BorderRadius.circular(25)
            ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              onSubmitted: (_) => _submitData(),
              decoration: new InputDecoration(
                labelText: 'Title',
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: _titleController,
              // decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              decoration: new InputDecoration(
                labelText: 'Amount',
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 50.0, color: Colors.red),
                ),
              ),
// onChanged: (val) {
//   amountInput = val;
// },
              controller: _amountController,
// decoration: InputDecoration(labelText: 'Title'),
            ),
            Container(
              height: 70.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                                      child: Text(_SelectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_SelectedDate)}'),
                  ),
                  FlatButton(
                      onPressed: _presentDatePicker,
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            RaisedButton(
               color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,

              onPressed: () {
                _submitData();
              },
              child: Text(
                'Add Transactions',
                style: TextStyle(
                    //color: Theme.of(context).primaryColor,
                    ),
              ),
              //  textColor: AppbarColor,
            )
          ],
        ),
      ),
    );
  }
}
