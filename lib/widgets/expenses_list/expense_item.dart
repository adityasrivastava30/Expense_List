import 'package:expense_project/models/expense.dart';
import 'package:flutter/material.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // give a nice card view
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title , style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\u{20B9} ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(), // widget for adding the space between column and rows.
                Row(
                  children: [
                     Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 9),
                    Text(expense.formatedDate)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
