import 'package:Starter2/models/transaction.dart';
import 'package:Starter2/widgets/createtransaction.dart';
import 'package:Starter2/widgets/user-transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand'
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final List<Transaction> transactions = [];

  void createTransaction(String amount, String title) {
    setState(() {
      transactions.add(Transaction(
        amount: double.parse(amount),
        title: title,
        date: DateTime.now(),
        id: int.parse(transactions.isEmpty? '0':transactions[transactions.length-1].id).toString()
      ));
    });
  }
  
  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      builder: (bCtx) {
        return CreateTransaction(createTransaction);
      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () =>startAddNewTransaction(context))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Container(
                child: Text(
                  'Charts',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              elevation: 5,
            ),
          ),
          UserTransaction(transactions)
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () =>startAddNewTransaction(context)),
    );
  }
}
