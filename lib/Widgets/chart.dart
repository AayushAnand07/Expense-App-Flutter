import 'package:expense_app/Widgets/chat_bar.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double Totalsum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          Totalsum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(Totalsum);

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': Totalsum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      //  color: Color(0xFF080808),
        elevation: 6.0,
        margin: EdgeInsets.all(10),
        child: Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: groupedTransactionValues.map((data) {
        return Flexible(
          // flex: 1,
          fit: FlexFit.tight,
          child: ChartBar(
              data['day'],
              data['amount'],
              totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending),
        );
      }).toList(),
    ),
        ),
      );
  }
}
