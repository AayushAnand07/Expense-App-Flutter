import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctofTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctofTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx , constraint) {

       return  Column(
          children: <Widget>[
            Container(
                height: constraint.maxHeight * 0.15,
                child: FittedBox(
                    child:
                        Text('\u{20B9}${spendingAmount.toStringAsFixed(2)}'))),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.6,
              width: 20.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctofTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.15,
              child: Text(label),
            ),
          ],
        );
      },
    );
  }
}
