import 'package:flutter/material.dart';


class CreateTransaction extends StatefulWidget {
  final Function createTransaction;

  CreateTransaction(this.createTransaction);

  @override
  _CreateTransactionState createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addTransaction(String title, String amount, BuildContext context) {
    if (title==''||amount=='') {
      final snackbar = SnackBar(
        content: Text('You need to fill all fields'),
        action: SnackBarAction(label: 'OK', onPressed: () => Scaffold.of(context).hideCurrentSnackBar()),
        );
      Scaffold.of(context).showSnackBar(snackbar);

    } else {
      widget.createTransaction(amount, title);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return           
    Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                // onChanged: (val) => titleInput = val,
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (val) => amountInput = val,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (text) => addTransaction(titleController.text, amountController.text, context),
              ),
              FlatButton(
                onPressed: () => addTransaction(titleController.text, amountController.text, context),
                child: Text('Add transaction'),
                textColor: Colors.lightBlue,
              )
            ]),
      ));
  }
}