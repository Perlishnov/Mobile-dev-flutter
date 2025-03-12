import 'package:expense_tracker/components/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.onThemeToggle, required this.isLightTheme});

  final void Function(bool isLight) onThemeToggle;
  final bool isLightTheme;

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Pago Universidad',
      amount: 10.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cine',
      amount: 15.59,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewExpense(onAddExpense: _addNewExpense);
      },
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
        content: Center(child: Text('Expense Deleted')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainContent = _registeredExpenses.isEmpty
        ? Center(child: Text("You don't have any expenses yet"))
        : ExpensesList(
      expenses: _registeredExpenses,
      onRemoveExpense: _removeExpense,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add, size: 40),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text('Settings'),
            ),
            CircleAvatar(
              radius: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Switch Theme'),
                  CupertinoSwitch(
                    value: widget.isLightTheme,
                    onChanged: widget.onThemeToggle,
                  ),
                ],
              ),
            ),
            Spacer(),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  Text('Salir'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
