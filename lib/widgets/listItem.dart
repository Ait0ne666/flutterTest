import 'package:Starter2/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final Transaction transaction;

  ListItem({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Row(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.all(8),
            child: Text(
              '\$' + transaction.amount.toStringAsFixed(2),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor
                  ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                DateFormat.yMMMd().format(transaction.date),
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.grey
                ),
              ),
            )
          ],
        )
      ],
    )));
  }
}
