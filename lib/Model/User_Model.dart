import 'package:cloud_firestore/cloud_firestore.dart';

class User_Model {
  final String id;
  final String email;
  final String password;
  final String Name;
  final String MobileNo;

  User_Model({
    required this.id,
    required this.MobileNo,
    required this.Name,
    required this.email,
    required this.password,
  });

  factory User_Model.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return User_Model(
      id: snapshot.id,
      email: data['email'] ?? "",
      MobileNo: data['MobileNo'] ?? "",
      password: data['password'] ?? "",
      Name: data['Name'] ?? "",
    );
  }
}
