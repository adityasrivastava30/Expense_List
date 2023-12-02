import 'package:expense_project/expenses_list.dart';
import 'package:expense_project/models/expense.dart';
import 'package:expense_project/widgets/chart/chart.dart';
import 'package:expense_project/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
// Its basically add a new dyanamic element when it executed .
  void _openAddExpenseOverlay() {
    setState(() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense),
      );
    });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense) {
    final expenseIndex = _registerdExpenses.indexOf(expense);
    setState(() {
      _registerdExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('undo'),
      duration: const Duration(seconds: 30),
      // creating a undo button .
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _registerdExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  final List<Expense> _registerdExpenses = [];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registerdExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registerdExpenses),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
