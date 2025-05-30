import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Model/expenseChart.dart';
import 'package:expense_tracker/VIew/Show_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseListScreen extends StatefulWidget {
  @override
  State<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  double totalAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense List')),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('Expense').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No expenses found.'));
          }

          // Reset totalAmount for each build
          totalAmount = 0.0;

          final expenses =
              snapshot.data!.docs
                  .map((doc) => expense.fromFirestore(doc))
                  .toList();

          for (var expense in expenses) {
            totalAmount += double.parse(expense.Amount);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    final expense = expenses[index];
                    return ListTile(
                      title: Text(expense.SellerName),
                      subtitle: Text('${expense.Amount} - ${expense.Category}'),
                      trailing: Text(expense.Date),
                      onTap: () {
                        // Handle tap if needed
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShowChart()));
              }, child: Text("Show Chart"))
            ],
          );
        },
      ),
    );
  }
}
