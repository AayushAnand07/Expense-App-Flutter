import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:expense_app/main.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No Transactions added, Yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                                '\u{20B9}${transactions[index].amount}'))),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                  icon: Icon(Icons.delete),
                   color: Theme.of(context).errorColor,
                   onPressed: (){ 
                       deleteTx(transactions[index].id);
                  },
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}

//  return Card(
//                     color: Color(0xFF080808),
//                     // color: ListbgColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                     elevation: 5.0,
//                     child: Row(
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             //border: Border.all(color: Color(0xFFCE1212), width: 2),
//                           ),
//                           padding: EdgeInsets.all(10),
//                           child: Text(
//                             '\u{20B9} ${transactions[index].amount.toStringAsFixed(2)}',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20.0,
//                                 color: Color(0xFFFF0038)),
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               transactions[index].title,
//                               style: Theme.of(context).textTheme.headline6,
//                             ),
//                             Text(
//                               DateFormat.yMMMd()
//                                   .format(transactions[index].date),
//                               style: TextStyle(color: Color(0xFF5A5959)),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
