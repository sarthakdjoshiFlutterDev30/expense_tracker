import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Model/expenseChart.dart';

class ExpenseListDetail extends StatefulWidget {
  final String time;

  const ExpenseListDetail({super.key, required this.time});

  @override
  State<ExpenseListDetail> createState() => _ExpenseListDetailState();
}

class _ExpenseListDetailState extends State<ExpenseListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense List Detail"), centerTitle: true),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Expense_list_Detail.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream:
              FirebaseFirestore.instance
                  .collection('Expense')
                  .where("Time", isEqualTo: widget.time)
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

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Category : ${expenses[0].Category}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Sub-Category : ${expenses[0].SubCategory}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Amount : ${expenses[0].Amount}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Date : ${expenses[0].Date}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Time : ${expenses[0].Time}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Seller Name : ${expenses[0].SellerName}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
