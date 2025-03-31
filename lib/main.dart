import 'package:expense_tracker/VIew/Home.dart';
import 'package:expense_tracker/VIew/Signup.dart';
import 'package:expense_tracker/VIew/Tearm&Conditions.dart';
import 'package:flutter/material.dart';

import 'VIew/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      },
    );
  }
}
