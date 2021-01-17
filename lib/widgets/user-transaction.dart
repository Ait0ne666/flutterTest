
import 'package:Starter2/models/transaction.dart';
import 'package:Starter2/widgets/transaction-list.dart';
import 'package:flutter/material.dart';



class UserTransaction extends StatelessWidget {
  final List<Transaction> transactions;

  UserTransaction(this.transactions);


  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Column(
        children: [
          TransactionList(transactions)
        ],
      ),
    );
  }
}