import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Model/expenseChart.dart';

class ShowChart extends StatefulWidget {
  const ShowChart({super.key});

  @override
  _ShowChartState createState() => _ShowChartState();
}

class _ShowChartState extends State<ShowChart> {
  List<expense> expenses = [];
  bool isLoading = true;
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    fetchExpenses();
  }

  Future<void> fetchExpenses() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('Expense')
            .where("Uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .get();
    setState(() {
      expenses =
          snapshot.docs.map((doc) => expense.fromFirestore(doc)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    Map<String, double> categoryData = {};
    totalAmount = 0;
    for (var expense in expenses) {
      double amount = double.parse(expense.Amount);
      categoryData[expense.Category] =
          (categoryData[expense.Category] ?? 0) + amount;
      totalAmount += amount;
    }

    print('Total Amount: $totalAmount');
    print('Category Data: $categoryData');

    const Map<String, Color> categoryColors = {
      'Housing': Colors.blue,
      'Transportation': Colors.green,
      'Food & Dining': Colors.red,
      'Health & Fitness': Colors.orange,
      'Entertainment': Colors.purple,
      'Loan': Colors.teal,
      'Billing': Colors.yellow,
    };
    const Map<String, Color> categoryTextColors = {
      'Housing': Colors.white,
      'Transportation': Colors.white,
      'Food & Dining': Colors.white,
      'Health & Fitness': Colors.black,
      'Entertainment': Colors.white,
      'Loan': Colors.white,
      'Billing': Colors.black,
    };

    List<PieChartSectionData> sections =
        categoryData.entries.map((entry) {
          double percentage = (entry.value / totalAmount) * 100;
          return PieChartSectionData(
            radius: MediaQuery.of(context).size.width * 0.19,
            value: entry.value,
            title: '${entry.key}\n${percentage.toStringAsFixed(1)}%',
            color: categoryColors[entry.key] ?? Colors.grey,
            titleStyle: TextStyle(
              fontSize: 20,
              color: categoryTextColors[entry.key],
              fontWeight: FontWeight.bold,
            ),
          );
        }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Expense Chart'), centerTitle: true),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/chart_background.jpg'),
          ),
        ),
        child: Center(
          child: PieChart(
            PieChartData(
              sections: sections,
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
