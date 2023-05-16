import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


// for formating date'
// object has been created
final formatter = DateFormat.yMd();

// for generatind the unique id
const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons={
  Category.food: Icons.lunch_dining,
  Category.leisure : Icons.movie,
  Category.travel : Icons.flight,
  Category.work : Icons.work

};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;


  String get formatedDate
  {
      return formatter.format(date);
  }

}

// for chart use 
class ExpenseBucket
{
  const ExpenseBucket({required this.category , required this.expenses});
  
   ExpenseBucket.forCategory(List<Expense>allExpense , this.category) : expenses=allExpense.where((expense) => expense.category==category).toList();

  final  Category category;
  final List<Expense>expenses;

  double get totalExpense
  {
    double sum=0;
    for(final expense in expenses)
    {
      sum+=expense.amount;
    }
    return sum;
  }

}