import 'expense_model.dart';

class BudgetCategory {
  final String name;
  final double maxAmount;
  final List<Expense> expenses;

  BudgetCategory({this.name, this.maxAmount, this.expenses});
}
