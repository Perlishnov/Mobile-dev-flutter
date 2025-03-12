import 'package:flutter/material.dart';

import '../expenses.dart';
import '../models/expense.dart';
import 'expense_card.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
            key: ValueKey(expenses[index]) ,
            onDismissed: (direction){
              //Remover el elemento
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseCard(expense: expenses[index],));
      },
    );
  }
}