import 'package:email_validator/email_validator.dart';
import 'package:expense_tracker/controller/Firebase_Controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var name = TextEditingController();
  var mobile = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var cpassword = TextEditingController();
  bool _isChecked = false;
  bool _isshow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/signup_Background.jpg"),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: mobile,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    hintText: "Enter Mobile No.",
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: email,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Email Address",
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: password,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  keyboardType: TextInputType.text,
                  obscureText: _isshow,
                  obscuringCharacter: "*",

                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isshow = !_isshow;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye),
                    ),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: cpassword,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  keyboardType: TextInputType.text,
                  obscureText: _isshow,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Enter Confirm Password",
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isshow = !_isshow;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye),
                    ),

                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox.adaptive(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false; // Update the state
                        });
                      },
                    ),
                    Text(
                      "I Agree With",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/tnc");
                      },
                      child: Text(
                        "T&C",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                (_isChecked)
                    ? Visibility(
                      visible: _isChecked,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (password.text.toString() ==
                                    cpassword.text.toString() &&
                                EmailValidator.validate(
                                  email.text.trim().toString(),
                                )) {
                              Firebase_Controller.addUser(
                                {
                                  "Name": name.text.trim().toString(),
                                  "MobileNo": mobile.text.trim().toString(),
                                  "email": email.text.trim().toString(),
                                  "password": password.text.trim().toString(),
                                  "Uid": FirebaseAuth.instance.currentUser?.uid,
                                },
                                "User",
                                FirebaseAuth.instance.currentUser!.uid,
                              ).then((e) {
                                Firebase_Controller.signUp(
                                  email.text.toString(),
                                  password.text.toString(),
                                );
                                name.clear();
                                mobile.clear();
                                email.clear();
                                password.clear();
                                cpassword.clear();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Signup Successfully",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Enter Email Or Password Correctly",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Text(
                            "Signup",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                    : Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        "Agree The Terms And Conditions",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Thank You For Using Our App",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
