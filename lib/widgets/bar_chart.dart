import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  const BarChart({
    Key key,
    this.expenses,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {}),
              Text(
                'Dec 10, 2020 - Jan 10, 2021',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ),
                  onPressed: () {}),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bar(
                label: 'Su',
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mo',
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tu',
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'We',
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Th',
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fr',
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sa',
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  const Bar({
    Key key,
    this.label,
    this.amountSpent,
    this.mostExpensive,
  }) : super(key: key);
  final double maxBarHeight = 150;
  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
