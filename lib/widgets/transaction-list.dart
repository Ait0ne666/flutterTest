import 'package:Starter2/models/transaction.dart';
import 'package:Starter2/widgets/listItem.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
        // margin: EdgeInsets.only(top: 20),
        child: transactions.length==0
            ? Column(children: [
                Text('There is no transactions'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListItem(transaction: transactions[index]);
                },
                itemCount: transactions.length,
              ));
  }
}
