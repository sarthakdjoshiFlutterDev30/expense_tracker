import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Model/expenseChart.dart';
import 'package:expense_tracker/VIew/Expense_List_Detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExpenseListScreen extends StatefulWidget {
  @override
  State<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense List')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Expense_list.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream:
              FirebaseFirestore.instance
                  .collection('Expense')
                  .where(
                    "Uid",
                    isEqualTo: FirebaseAuth.instance.currentUser?.uid,
                  )
                  .snapshots(),
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

            final expenses =
                snapshot.data!.docs
                    .map((doc) => expense.fromFirestore(doc))
                    .toList();

            return ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return ListTile(
                  title: Text(
                    expense.SellerName,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Text(
                    '${expense.Amount} - ${expense.Category}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  trailing: Text(
                    expense.Date,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ExpenseListDetail(time: expense.Time),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
