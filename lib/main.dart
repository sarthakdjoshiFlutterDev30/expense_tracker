import 'package:expense_tracker/VIew/Home.dart';
import 'package:expense_tracker/VIew/Signup.dart';
import 'package:expense_tracker/VIew/Tearm&Conditions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'VIew/Login.dart';
import 'VIew/show_list.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/login",
      routes: {
        "/signup": (context) => SignUp(),
        "/tnc": (context) => TermsAndConditions(),
        "/login": (context) => Login(),
        "/home": (context) => Home(),
        "/expenseList": (context) => ExpenseListScreen(),
      },
    );
  }
}
