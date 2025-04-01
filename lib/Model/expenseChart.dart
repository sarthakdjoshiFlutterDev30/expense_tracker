import 'package:cloud_firestore/cloud_firestore.dart';

class expense {
  final String id;
  final String Uid;
  final String Amount;
  final String Category;
  final String Date;
  final String SellerName;
  final String SubCategory;
  final String Time;

  expense({
    required this.id,
    required this.Uid,
    required this.Amount,
    required this.Category,
    required this.Date,
    required this.SellerName,
    required this.SubCategory,
    required this.Time,
  });

  factory expense.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return expense(
      id: snapshot.id,
      Uid: data['Uid'] ?? "",
      Amount: data['Amount'] ?? "",
      Category: data['Category'] ?? "",
      SubCategory: data['SubCategory'] ?? "",
      Date: data['Date'] ?? "",
      Time: data['Time'] ?? "",
      SellerName: data['SellerName'] ?? "",
    );
  }
}
