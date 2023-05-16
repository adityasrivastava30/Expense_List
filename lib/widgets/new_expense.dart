import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_project/models/expense.dart';

final formater = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedcategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitdata() {
    final enterAmount = double.tryParse(_amountController.text);
    final ammountIsinvalid = enterAmount == null || enterAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        ammountIsinvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make a valid input title,amount,date and category'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Okay'))
                ],
              )
            );
      return;
    }
     widget.onAddExpense(Expense(title: _titleController.text, amount: enterAmount, date: _selectedDate!, category: _selectedcategory),);
     Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16,30,16,16),
        child: Column(
          children: [
            TextField(
              controller:
                  _titleController, // registered a function when a value get pressed on key stroke ;
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                        _amountController, // registered a function when a value get pressed on key stroke ;
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '₹',
                      label: Text('Amount'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No date selected '
                            : formater.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                DropdownButton(
                    value: _selectedcategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedcategory = value;
                      });
                    }),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ), // cancel button
                const SizedBox(width: 20),
                ElevatedButton(
                  // saved changes
                  onPressed: _submitdata,
                  child: const Text('Save Expense'),
                ),
              ],
            )
          ],
        ));
  }
}
