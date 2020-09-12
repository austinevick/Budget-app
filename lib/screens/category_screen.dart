import 'package:budget_tracker/helpers/color_helper.dart';
import 'package:budget_tracker/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

import 'package:budget_tracker/models/category_model.dart';

class CategoryScreen extends StatefulWidget {
  final BudgetCategory category;
  const CategoryScreen({
    Key key,
    this.category,
  }) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  buildExpenses() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((expense) {
      expenseList.add(
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expense.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Text('-\$${expense.cost.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0),
                  ]),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                    bgColor: Colors.grey[200],
                    lineColor: getColor(context, percent),
                    percent: percent,
                    width: 15.0),
                child: Center(
                  child: Text(
                      '\$${amountLeft.toStringAsFixed(2)}/ \$${widget.category.maxAmount}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ),
            buildExpenses()
          ],
        ),
      ),
    );
  }
}
