import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), child: Column(
        children: [
          Text(expense.title),
          const SizedBox(height: 4),
          Row(
            children: [
              Text("\$${expense.amount.toStringAsFixed(2)}"),
              const Spacer(),
              Icon(categoryIcons[expense.category]),
        ],
      )],

      ),

    ));
  }
}
