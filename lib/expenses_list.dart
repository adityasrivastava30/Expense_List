import 'package:expense_project/models/expense.dart';
import 'package:expense_project/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // creating a scrollable list view of expenses;
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.03),
        margin:EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),),// using color from the theme widget
        onDismissed:(direction) => {
          onRemoveExpense(expenses[index])
        },
        child: Expenseitem(
          expenses[index],
        ),
      ),
    );
  }
}
